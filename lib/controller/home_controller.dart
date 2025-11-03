import 'package:api_define/model/get_data_model.dart';
import 'package:api_define/services/api_client.dart';
import 'package:api_define/utils/urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  ApiClient apiClient = ApiClient();

  RxList<GetDataModel> getData = <GetDataModel>[].obs;
  RxBool getDataProgress = false.obs;

  Future getApi() async {
    getDataProgress.value = true;
    debugPrint("=== Get Data In Progress : ${getDataProgress.value}");
    try {
      var response = await apiClient.getData(
        'https://api.restful-api.dev/objects',
        isShowResult: false,
      );
      if (response.statusCode == 200) {
        getData.value = GetDataModel.fromJsonList(response.body);
        getDataProgress.value = false;
debugPrint("=== Get Data In Progress : ${getDataProgress.value}");
      }
    } catch (e) {
      getDataProgress.value = false;
      debugPrint("=== Get Data In Progress : ${getDataProgress.value}");
      debugPrint("=== Error is : $e === ");
    }
  }

  Future postApi() async {
    debugPrint("=== POST URL : $postURL");
    var body = {
      "name": "Apple MacBook Pro 16",
      "data": {
        "year": 2019,
        "price": 1849.99,
        "CPU model": "Intel Core i9",
        "Hard disk size": "1 TB",
      },
    };
    try {
      var response = await apiClient.postData(
        postURL,
        body: body,
        header: {"Content-Type": "application/json"},
        isShowResult: true,
      );
      if (response.statusCode == 200) {

      }
    } catch (e) {
      debugPrint("=== Error is : $e ===");
    }
  }
}
