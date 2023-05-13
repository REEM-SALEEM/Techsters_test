import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart' show debugPrint;
import 'package:techsterstest/festivals/models/festival_model.dart';
import 'package:techsterstest/utils/app_constants.dart';
import 'package:techsterstest/utils/dio_exceptions.dart';

class FestivalService {
  Future<Festive?> getFestivalList() async {
    try {
      Response response = await Dio().get(AppConstanst.baseUrl);
      debugPrint('LoginAPI response is ${response.data}');
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        final data = Festive.fromJson(json.decode(response.data));
        return data;
      } else {
        return null;
      }
    } catch (e) {
      log('ISSUE --> ${e.toString()}');
     DioException().dioError(e);
    }
    return null;
  }
}
