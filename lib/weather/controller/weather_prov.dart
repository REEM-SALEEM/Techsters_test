import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:techsterstest/services/weather_services.dart';

class WeatherProvider extends ChangeNotifier {
  dynamic weatherlist;
  bool showLoader = true;
  Future<void> callGetUserList(double lat, double long) async {
    final response = await WeatherService().getWeather(lat, long);

    if (response != null) {
      weatherlist = response;
      notifyListeners();
    } else {
      log('null');
    }

    showLoader = false;
    notifyListeners();
  }
}
