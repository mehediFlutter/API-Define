import 'package:api_define/model/get_data_model.dart';
import 'package:api_define/services/api_client.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  ApiClient apiClient = ApiClient();
  RxList<GetDataModel> getData = <GetDataModel>[].obs;
  RxBool getDataProgress = false.obs;

  Future getApi() async {
    try {
      var response = await apiClient.getData(
        'https://api.restful-api.dev/objects',
        isShowResult: true,);
      if(response.statusCode == 200){
        getData.value = GetDataModel.fromJsonList(response.body);
        debugPrint("=== data from variable : ${getData.toString()}");
      }
    } catch (e) {
      debugPrint("=== Error is : $e === ");
    }
  }
}
