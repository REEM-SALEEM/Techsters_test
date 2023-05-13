import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:techsterstest/festivals/models/festival_model.dart';
import 'package:techsterstest/festivals/models/festival_record_mode.dart';
import 'package:techsterstest/services/festival_services.dart';

class FestivalProvider extends ChangeNotifier {
  List<Record> festlist = [];

  bool showLoader = true;
  Future<void> catergoryList() async {
    Festive? response = await FestivalService().getFestivalList();

    if (response != null) {
      if (response.records != null) {
        festlist = response.records ?? [];
        notifyListeners();
      } else {
        log('records null');
      }
    } else {
      log('null');
    }

    showLoader = false;
    notifyListeners();
  }
}
