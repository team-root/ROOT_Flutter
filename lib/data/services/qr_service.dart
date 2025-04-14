import 'package:root/data/dio.dart';
import 'package:root/data/services/base_service.dart';

class QRService extends BaseService {
  const QRService() : super('/qr');

  Future<int?> createQRCode(int id) async {
    try {
      final response = await dio.get(resolve('/'));
      return int.tryParse(response.data['qrCode']);
    } catch (e) {
      log('/', e);
      return null;
    }
  }

  Future<bool> isQR(int value) async {
    try {
      final response = await dio.post(resolve('/scan'), data: {
        'qrCode': value
      });
      return response.data['isQrcode'];
    } catch (e) {
      log('/scan', e);
      return false;
    }
  }
}