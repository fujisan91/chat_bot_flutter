import 'dart:convert';
import 'package:chatbot/configs/appConstants.dart';
import 'package:http/http.dart' as http;
import 'package:chatbot/model/getNobyResponse.dart';

class ApiHelper {
  static Future<GetNobyResponse> requestNoby(String inputMessage) async {
    var queryParameters = {
      'appkey': AppConstants.nobyAppKey,
      'text': inputMessage,
    };
    var uri = Uri.https(AppConstants.nobyUri, AppConstants.nobyPath, queryParameters);

    // API呼び出し
    final response = await http.get(uri,headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      return GetNobyResponse(json.decode(utf8.decode(response.bodyBytes))['text']);
    } else {
      throw Exception('Failed to load api');
    }
  }
}