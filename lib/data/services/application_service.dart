import 'package:root/data/dio.dart';
import 'package:root/data/services/base_service.dart';

class ApplicationService extends BaseService {
  const ApplicationService() : super('/volunteer/applications');

  Future<bool> application(int id) async {
    try {
      await dio.post(resolve('/$id'));
      return true;
    } catch (e) {
      log('/$id (application)', e);
      return false;
    }
  }

  // TODO: Implements ModelClass
  Future<Map<String, dynamic>?> getApplicants(int id) async {
    try {
      final response = await dio.get(resolve('/$id'));
      return response.data;
    } catch (e) {
      log('/$id (get applicants)', e);
      return null;
    }
  }

  Future<bool> decision({required int id, required bool isAccepted}) async {
    try {
      await dio.post(resolve('/status'), data: {
        'applicationId': id,
        'isAccepted': isAccepted
      });
      return true;
    } catch (e) {
      return false;
    }
  }
}