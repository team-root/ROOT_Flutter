import 'package:root/data/dio.dart';
import 'package:root/data/services/base_service.dart';

class AuthService extends BaseService {
  const AuthService() : super('/auth');

  Future<bool> login({
    required String xquareId,
    required String password,
    String? deviceToken
  }) async {
    try {
      final response = await dio.post(resolve('/login'), data: {
        'xquareId': xquareId,
        'password': password,
        if (deviceToken != null) 'deviceToken': deviceToken
      });
      setTokens(
        accessToken: response.data['accessToken'],
        refreshToken: response.data['refreshToken']
      );
      return true;
    } catch (e) {
      log('/login', e);
      return false;
    }
  }

  Future<void> logout() async {
    await removeTokens();
  }
}