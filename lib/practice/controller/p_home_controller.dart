import 'package:api_define/practice/models/get_data_model.dart';
import 'package:api_define/practice/network/api_client.dart';
import 'package:api_define/practice/utils/p_urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PHomeController extends GetxController {
  ApiClient apiClient = ApiClient();
  Rx<PGetDataModel> pGetData = PGetDataModel().obs;
  RxBool pGetDataLoader = false.obs;

  Future<void> callGetAPI() async {
    pGetDataLoader.value = true;
    try {
      var response = await apiClient.getMethod(
        Urls.getObject,
        showResult: true,
      );
      if(response.statusCode == 200){
    //    pGetData.value = PGetDataModel().;
      }
    } catch (e) {
      debugPrint("=== error : $e ===");
    }
  }
}
