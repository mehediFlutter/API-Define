import 'dart:convert';
import 'package:api_define/practice/UI/widgets/toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  Future<Response> getMethod(String url, {
    Map<String, String>? header,
    bool showResult = false,
  }) async {
    try {
      var response = await http.get(Uri.parse(url), headers: header);
      if (showResult) {
        debugPrint(
          "Result : url : $url\n body : ${response
              .body}\n status code : ${response.statusCode}, header : ${response
              .headers}",
        );
      }

      var body = jsonDecode(response.body);

        return Response(body,
        response.statusCode,
      );
    } catch (e) {
      debugPrint("=== API Client Error : $e =====");
      PToast.errorToast('Something wrong please try again');
      return Response('', 400);
    }
  }
}
