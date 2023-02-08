import 'package:flutter_golang_yt/services/service.dart';
import 'package:flutter_golang_yt/utils/app_costants.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class DataController extends GetxController {
  DataService service = DataService();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List<dynamic> _myData = [];
  List<dynamic> get myData => _myData;
  Map<String, dynamic> _singleData = {};
  Map<String, dynamic> get singleData => _singleData;

  Future<void> getData() async {
    _isLoading = true;
    Response response = await service.getData(AppConstants.GET_TASKS);
    print(response.statusText);
    if (response.statusCode == 200) {
      _myData = response.body;
      print("we got data :)");
      update();
    } else {
      print("did not get data :( ");
    }
    _isLoading = false;
  }

  Future<void> getSingleData(String id) async {
    _isLoading = true;
    Response response =
        await service.getData('${AppConstants.GET_TASK}' '/$id');
    print(response.statusText);
    if (response.statusCode == 200) {
      print({response.body});
      _singleData = response.body;
      print("we got data :)");
      update();
    } else {
      print("singl data: did not get data :( ");
    }
    _isLoading = false;
  }

  Future<void> postData(
    String task,
    String taskDetail,
  ) async {
    _isLoading = true;
    Response response = await service.postData(AppConstants.POST_TASKS,
        {"task_name": task, "task_detail": taskDetail});
    print(response.statusText);
    if (response.statusCode == 200) {
      print("we sent data :)");
      update();
    } else {
      print("did not send data :( ");
    }
  }

  Future<void> updateData(String task, String taskDetail, int id) async {
    _isLoading = true;
    // print("#############################");
    print('${AppConstants.UPDATE_TASK}' '/$id');
    Response response = await service.updateData(
        '${AppConstants.UPDATE_TASK}' '/$id',
        {"task_name": task, "task_detail": taskDetail});
    print(response.statusText);
    if (response.statusCode == 200) {
      print("update: we sent data :)");
      update();
    } else {
      print("update: did not send data :( ");
    }
  }

  Future<void> deleteData(int id) async {
    _isLoading = true;
    print("#############################");
    print('${AppConstants.DELETE_TASK}' '/$id');
    Response response =
        await service.deleteData('${AppConstants.DELETE_TASK}' '/$id');
    print(response.statusText);
    if (response.statusCode == 200) {
      print("update: we sent data :)");
      update();
    } else {
      print("update: did not send data :( ");
    }
  }
}
