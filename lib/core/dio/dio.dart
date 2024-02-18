import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

String _kBaseUrl = "https://luckyapp.in/kaam/api/index.php";

///[CustomDio] A abstraction class
abstract class CustomDio {
  Future<String> callApiPost(
      {String? customUrl, required Map<String, dynamic> jsonDataAsMap});
  Future<String> callApiGet(
      {String? customUrl, required Map<String, dynamic> getDataAsMap});
}

///[CustomDioImpl] A implementation of abstraction class
class CustomDioImpl implements CustomDio {
  ///[CustomDioImpl] constructer wich takes optional value [Dio] and
  ///[String] base url if none is defined a default base url will be taken.
  CustomDioImpl({Dio? dioInject, String? baseUrl}) {
    if (dioInject == null) {
      dio = Dio();
    } else {
      dio = dioInject;
    }
    if (baseUrl == null) {
      apiUrl = _kBaseUrl;
    } else {
      apiUrl = baseUrl;
    }
  }

  late String apiUrl;
  late Dio dio;

  ///[callApiPost] will make a network call through internet and
  ///[String] returns a response in string format
  ///[customUrl] can be passed at the time of api call.
  ///[jsonDataAsMap] can be passed optionally
  ///if not passed  url will be taken from constructor.
  @override
  Future<String> callApiPost(
      {String? customUrl, required Map<String, dynamic> jsonDataAsMap}) async {
    try {
      ///Rest Api call happens here
      var response = await dio.post(
        customUrl ?? apiUrl,
        options: Options(
          responseType: ResponseType.plain,
        ),
        data: jsonEncode(jsonDataAsMap),
      );

      /// Result will be converted to string.
      String result = response.data.toString();
      if (kDebugMode) {
        print('\x1B[32m--------------Result-----------------\x1B[0m');
      }
      if (kDebugMode) {
        print(result);
      }
      if (kDebugMode) {
        print('\x1B[32m--------------Result End-----------------\x1B[0m');
      }

      return result;
    } catch (ex) {
      if (kDebugMode) {
        print('\x1B[33m--------------Error-----------------\x1B[0m');
      }
      if (kDebugMode) {
        print(ex.toString());
      }
      if (kDebugMode) {
        print('\x1B[33m--------------Error End-----------------\x1B[0m');
      }
      rethrow;
    }
  }

  @override
  Future<String> callApiGet(
      {String? customUrl, required Map<String, dynamic> getDataAsMap}) async {
    try {
      ///Rest Api call happens here
      var response = await dio.get(
        customUrl ?? apiUrl,
        options: Options(
          responseType: ResponseType.plain,
        ),
        queryParameters: getDataAsMap,
      );

      /// Result will be converted to string.
      String result = response.data.toString();
      if (kDebugMode) {
        print('\x1B[32m--------------Result-----------------\x1B[0m');
      }
      if (kDebugMode) {
        print(result);
      }
      if (kDebugMode) {
        print('\x1B[32m--------------Result End-----------------\x1B[0m');
      }

      return result;
    } catch (ex) {
      if (kDebugMode) {
        print('\x1B[33m--------------Error-----------------\x1B[0m');
      }
      if (kDebugMode) {
        print(ex.toString());
      }
      if (kDebugMode) {
        print('\x1B[33m--------------Error End-----------------\x1B[0m');
      }
      rethrow;
    }
  }
}
