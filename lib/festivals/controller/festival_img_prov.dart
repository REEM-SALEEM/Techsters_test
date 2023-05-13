import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:techsterstest/festivals/models/festival_record_mode.dart';
import 'package:techsterstest/services/festival_img_services.dart';

class FestivalTwoProvider extends ChangeNotifier {
  List<RecordTwo> festimglist = [];

  bool showLoader = true;
  Future<void> getImgList(int no) async {
    final response = await FestivalTwoService().getImageList(no);

    if (response != null) {
      if (response.records != null) {
        festimglist = response.records ?? [];

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
