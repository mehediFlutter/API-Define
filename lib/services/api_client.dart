import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../helper/shared_prefe.dart';

class ApiClient extends GetxService{
  static var client = http.Client();

  String bearerToken = '';

  Future<Response> getData(
    String url, {
    Map<String, dynamic>? query,
    Map<String, String>? header,
  }) async {
    /// ============== get bearer token ==========================
    bearerToken = await SharePrefsHelper.getString('bearerToken');

    /// ============== Header with token ==========================
    var mainHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $bearerToken',
    };

    try {
      debugPrint("Api call === $url\nHeader ${header ?? mainHeaders}");
      http.Response response = await client.get(
        Uri.parse(url),
        headers: header ?? mainHeaders,
      );
      var body = jsonDecode(response.body);

      return Response(
        body: body,
        bodyString: response.body.toString(),
        headers: response.headers,
        statusCode: response.statusCode,
        statusText: response.reasonPhrase,
      );
    } catch (e) {
      debugPrint("=== error is : ${e.toString()}");
      return const Response(
          body: {}, statusCode: 400, statusText: "Something went wrong");
    }
  }
}
