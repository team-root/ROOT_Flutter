import 'package:flutter/material.dart';
import 'package:root/data/dio.dart';
import 'package:root/data/services/base_service.dart';

class NotificationService extends BaseService {
  const NotificationService() : super('/notifications');

  Future<bool> createNotification({
    required bool isRegular,
    required String title,
    required String body,
    String? dayOfWeek,
    DateTimeRange? range,
    required TimeOfDay time
  }) async {
    if (isRegular && dayOfWeek == null) {
      throw const FormatException('when isRegular == true -> dayOfWeek must be not null');
    } else if (!isRegular && range == null) {
      throw const FormatException('when isRegular == false -> range must be not null');
    }
    try {
      await dio.post(resolve('/'), data: {
        'isRegular': isRegular,
        'title': title,
        'body': body,
        if (dayOfWeek != null) 'dayOfWeek': dayOfWeek,
        if (range != null) 'startDate': formatDate(range.start),
        if (range != null) 'endDate': formatDate(range.end),
        'time': formatTime(time)
      });
      return true;
    } catch (e) {
      log('/ (create notification)', e);
      return false;
    }
  }

  // TODO: Implements ModelClass
  Future<Map<String, dynamic>?> readNotifications() async {
    try {
      final response = await dio.get(resolve('/'));
      return response.data;
    } catch (e) {
      log('/ (read notifications)', e);
      return null;
    }
  }

  // TODO: await backend.developAPI();
  Future<bool> editNotification() async {
    return true;
  }
}