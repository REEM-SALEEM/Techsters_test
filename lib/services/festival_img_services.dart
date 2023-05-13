import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:techsterstest/festivals/models/festival_model.dart';

import '../utils/dio_exceptions.dart';

class FestivalTwoService {
  Future<FestivTwo?> getImageList(int no) async {
    try {
      Response response = await Dio().get(
          'https://resonancehyderabad.com/gallerysapi.php?category_id=$no');
      log('LoginAPI response is ${response.data}');
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        final data = FestivTwo.fromJson(json.decode(response.data));
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
