import 'package:root/data/dio.dart';
import 'package:root/data/services/base_service.dart';
import 'package:root/presentation/mypage/user/model/my_page_model.dart';

class UserService extends BaseService {
  const UserService() : super('/users');

  Future<MyPageModel?> info() async {
    try {
      final response = await dio.get(resolve('/me'));
      return MyPageModel.fromJson(response.data);
    } catch (e) {
      log('/info', e);
      return null;
    }
  }
}