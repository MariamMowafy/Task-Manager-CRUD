import 'package:flutter/foundation.dart';
import 'package:flutter_golang_yt/utils/app_costants.dart';
import 'package:get/get.dart';

class DataService extends GetConnect implements GetxService {
  Future<Response> getData(String uri) async {
    if (kDebugMode) {
      print(AppConstants.BASE_URL + uri);
    }
    Response response = await get(AppConstants.BASE_URL + uri,
        headers: {'Content-Type': 'application/json; charset=UTF-8'});

    print(response.body);
    return response;
  }

  Future<Response> postData(String uri, dynamic body) async {
    Response response = await post(AppConstants.BASE_URL + uri, body,
        headers: {'Content-Type': 'application/json; charset=UTF-8'});

    print(response.body);
    return response;
  }

  Future<Response> updateData(String uri, dynamic body) async {
    Response response = await put(AppConstants.BASE_URL + uri, body,
        headers: {'Content-Type': 'application/json; charset=UTF-8'});

    print(response.body);
    return response;
  }

  Future<Response> deleteData(String uri) async {
    Response response = await delete(AppConstants.BASE_URL + uri,
        headers: {'Content-Type': 'application/json; charset=UTF-8'});

    print(response.body);
    return response;
  }
}
