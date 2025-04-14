import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:root/data/dio.dart';
import 'package:root/data/services/base_service.dart';
import 'package:root/presentation/main/user/model/detail_main_page_model.dart';
import 'package:root/presentation/main/user/model/main_page_model.dart';

class PostService extends BaseService {
  const PostService() : super('/posts');

  Future<String?> createPost({
    required String title,
    required String activityDetails,
    required DateTimeRange applicationPeriod,
    DateTimeRange? workDate,
    List<(int, String)>? dayOfWeek,
    required String place,
    required String time,
    required String personnel,
    required List<(int, String)> role,
    required bool isRegular
  }) async {
    if (isRegular && dayOfWeek == null) {
      throw const FormatException('when isRegular == true -> dayOfWeek must be not null');
    } else if (!isRegular && workDate == null) {
      throw const FormatException('when isRegular == false -> workDate must be not null');
    }
    String formatDate(DateTime date) {
      final year = date.year.toString().padLeft(4, '0');
      final month = date.month.toString().padLeft(2, '0');
      final day = date.day.toString().padLeft(2, '0');
      return '$year-$month-$day';
    }
    try {
      await dio.post(resolve('/'), data: {
        'isRegular': isRegular,
        'title': title,
        'activityDetails': activityDetails,
        'applicationPeriod': {
          'startDate': formatDate(applicationPeriod.start),
          'endDate': formatDate(applicationPeriod.end)
        },
        if (workDate != null) 'workDate': {
          'startDate': formatDate(workDate.start),
          'endDate': formatDate(workDate.end)
        },
        if (dayOfWeek != null) 'dayOfWeek': dayOfWeek.map((item) => {
          'dayId': item.$1,
          'dayOfWeek': item.$2
        }),
        'place': place,
        'time': time,
        'personnel': personnel,
        'role': role.map((item) => {
          'roleId': item.$1,
          'title': item.$2
        })
      });
      return null;
    } on DioException catch (e) {
      log('/ (create post)', e);
      return e.response?.data['message'];
    } catch (e) {
      log('/ (create post)', e);
      return null;
    }
  }

  Future<MainPageModel?> getPosts() async {
    try {
      final response = await dio.get(resolve('/'));
      return MainPageModel.fromJson(response.data);
    } catch (e) {
      log('/ (get posts)', e);
      return null;
    }
  }

  Future<DetailMainPageModel?> getPost(int id) async {
    try {
      final response = await dio.post(resolve('/$id'));
      return DetailMainPageModel.fromJson(response.data);
    } catch (e) {
      log('/$id (get post)', e);
      return null;
    }
  }

  Future<bool> editPost(int id, {
    required String title,
    required String activityDetails,
    required DateTimeRange applicationPeriod,
    DateTimeRange? workDate,
    List<(int, String)>? dayOfWeek,
    required String place,
    required String time,
    required String personnel,
    required List<(int, String)> role,
    required bool isRegular
  }) async {
    if (isRegular && dayOfWeek == null) {
      throw const FormatException('when isRegular == true -> dayOfWeek must be not null');
    } else if (!isRegular && workDate == null) {
      throw const FormatException('when isRegular == false -> workDate must be not null');
    }
    try {
      await dio.patch(resolve('/$id'), data: {
        'isRegular': isRegular,
        'title': title,
        'activityDetails': activityDetails,
        'applicationPeriod': {
          'startDate': formatDate(applicationPeriod.start),
          'endDate': formatDate(applicationPeriod.end)
        },
        if (workDate != null) 'workDate': {
          'startDate': formatDate(workDate.start),
          'endDate': formatDate(workDate.end)
        },
        if (dayOfWeek != null) 'dayOfWeek': dayOfWeek.map((item) => {
          'dayId': item.$1,
          'dayOfWeek': item.$2
        }),
        'place': place,
        'time': time,
        'personnel': personnel,
        'role': role.map((item) => {
          'roleId': item.$1,
          'title': item.$2
        })
      });
      return true;
    } catch (e) {
      log('/$id (edit post)', e);
      return false;
    }
  }

  Future<bool> deletePost(int id) async {
    try {
      await dio.delete(resolve('/$id'));
      return true;
    } catch (e) {
      return false;
    }
  }
}