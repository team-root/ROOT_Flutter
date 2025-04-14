import 'package:flutter/material.dart';

abstract class BaseService {
  final String prefix;

  const BaseService(this.prefix);

  String resolve(String path) => '$prefix$path';

  void log(String path, Object e) => debugPrint('[ERR] [$prefix/$path] $e');

  String formatDate(DateTime date) {
    final year = date.year.toString().padLeft(4, '0');
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    return '$year-$month-$day';
  }
  String formatTime(TimeOfDay time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}