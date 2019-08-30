import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_app/models/BannerModel.dart';
import 'package:flutter_app/models/TestModelEntity.dart';
import 'dart:convert';
import 'LogUtils.dart';

class HttpUtils {
  static Future<Map<String, dynamic>> HttpGetTest(String url) async {
    Map<String, dynamic> jsonMap;
    Response response;
    Dio dio = new Dio();
    response = await dio.get(url);
    if (response.data is Map) {
//      BannerModelEntity model =  BannerModelEntity.fromJson(response.data);
//      print(model.data[0].imagePath);
      //return true;
      jsonMap = response.data;
    } else {
      jsonMap = json.decode(response.data);
    }
    return jsonMap;

//    String res2Json  = json.encode(response.data);
//    Map<String,dynamic> jsonMap=json.decode(res2Json);
  }
}
