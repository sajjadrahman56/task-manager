import 'dart:developer';

import 'package:http/http.dart';
import 'dart:convert';

import 'network_response.dart';

class NetworkCaller {
  Future postRequest(String url, {Map<String, dynamic>? body}) async {
    try {
      final Response response =
          await post(Uri.parse(url), body: jsonEncode(body), headers: {
        'Content-Type': 'application/json',
      });
      log(response.statusCode.toString());
      log(response.body);

      if (response.statusCode == 200) {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          jsonResponse: jsonDecode(response.body),
        );
      }
      else{
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          jsonResponse: jsonDecode(response.body),
        );
      }
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }
}

