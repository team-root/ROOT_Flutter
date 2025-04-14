import 'package:root/data/dio.dart';
import 'package:root/data/services/base_service.dart';

class RoleService extends BaseService {
  const RoleService() : super('/volunteer/roles');

  // TODO: Implements ModelClass
  Future<Map<String, dynamic>?> getRoles(int id) async {
    try {
      final response = await dio.get(resolve('/$id'));
      return response.data;
    } catch (e) {
      log('/$id (get roles)', e);
      return null;
    }
  }

  Future<bool> setRole(int id, int userId, String role) async {
    try {
      await dio.post('/$id', data: {
        'userId': userId,
        'role': role
      });
      return true;
    } catch (e) {
      log('/$id (set role)', e);
      return false;
    }
  }
}