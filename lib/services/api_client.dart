import 'dart:convert';
import 'package:api_define/UI/widget/toast.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../helper/shared_prefe.dart';

class ApiClient extends GetxService {
  String bearerToken = '';

  /// ==================== Get Request =================
  Future<Response> getData(
    String url, {
    Map<String, dynamic>? query,
    Map<String, String>? header,
    bool isShowResult = false,
  }) async {
    /// ============== get bearer token ==============
    bearerToken = await SharePrefsHelper.getString('bearerToken');

    /// ============== Header with token ==============
    var mainHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $bearerToken',
    };

    try {
      var response = await http.get(Uri.parse(url));

      if (isShowResult) {
        debugPrint(
          "===Api call === $url\nHeader ${header ?? mainHeaders}\n body : ${response.body} ===",
        );
      }
      var body = jsonDecode(response.body);

      return Response(
        body: body,
        bodyString: response.body.toString(),
        headers: response.headers,
        statusCode: response.statusCode,
        statusText: response.reasonPhrase,
      );
    } catch (e) {
      Toast.errorToast("Something Wrong please try agein");
      debugPrint("=== error is : ${e.toString()} ===");

      return const Response(
        body: {},
        statusCode: 400,
        statusText: "Something went wrong",
      );
    }
  }

  /// ======================= POST REQUEST ==================
  Future<Response> postData(
    String url, {
    Map<String, dynamic>? body,
    Map<String, String>? header,
    bool isShowResult = false,
  }) async {
    try {
      var response = await http.post(
        Uri.parse(url),
        body: jsonEncode(body),
        headers: header,
      );

      /// ======== SHOW RESULT ============
      if (isShowResult) {
        debugPrint(
          "url : $url \n Status Code : ${response.statusCode}  \n body : ${response.body.toString()}\n header : $header",
        );
      }
      var decodedBody = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Toast.successToast(body?['message']??'successful');
      } else {
        Toast.errorToast(body?['message'] ?? 'Something wrong try again');
      }
      return Response(
        statusCode: response.statusCode,
        body: decodedBody,
        bodyString: decodedBody.toString(),
        headers: response.headers,
        statusText: response.reasonPhrase,
      );
    } catch (e) {
      debugPrint("=== eerror is : $e ===");
      return Response(
        statusCode: 400,
        body: {},
        statusText: 'Something Wring please try again ',
      );
    }
  }
}
