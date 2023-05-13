import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:techsterstest/utils/dio_exceptions.dart';

class WeatherService {
  Future<dynamic> getWeather(double long, double lat) async {
    try {
      Response response = await Dio().get(
          'https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$long&current_weather=true');
      debugPrint('LoginAPI response is ${response.data}');
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        final data = response.data;
        log(data.toString());
        return data;
      } else {
        return null;
      }
    } catch (e) {
      log('ISSUE --> ${e.toString()}');
      DioException().dioError(e);
    }
  }
}
