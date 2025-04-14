import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:root/data/const.dart';

const storage = FlutterSecureStorage();

final Dio dio = Dio()
..interceptors.add(CustomInterceptors())
..options.baseUrl = baseURL;

Future<void> setTokens({String? accessToken, String? refreshToken}) async {
  if (accessToken != null) await storage.write(key: accessTokenKey, value: accessToken);
  if (refreshToken != null) await storage.write(key: refreshTokenKey, value: refreshToken);
}

Future<void> removeTokens() async {
  await storage.delete(key: accessTokenKey);
  await storage.delete(key: refreshTokenKey);
}

class CustomInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('[REQ] [${options.method}] ${options.uri}');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint('[RES] [${response.requestOptions.method}] ${response.requestOptions.uri}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    debugPrint('[ERR] [${err.requestOptions.method}] ${err.requestOptions.uri}');
    final refreshToken = await storage.read(key: refreshTokenKey);

    if (refreshToken == null) {
      return handler.reject(err);
    }

    final isStatusCode401 = err.response?.statusCode == 401;
    final isPathReFresh = err.requestOptions.path == '/auth/login';

    if (isStatusCode401 && !isPathReFresh) {
      try {
        final resp = await Dio().post('$baseURL/auth/refresh', data: {
          'refreshToken': refreshToken,
        });

        final accessToken = resp.data['accessToken'];

        final options = err.requestOptions;

        options.headers.addAll({
          'authorization': 'Bearer $accessToken',
        });

        await storage.write(key: accessTokenKey, value: accessToken);

        final response = await dio.fetch(options);
        return handler.resolve(response);
      } on DioException catch (err) {
        return handler.reject(err);
      }
    }

    return handler.reject(err);
  }
}
