import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/api/api_constants.dart';
import 'package:news/api/end_points.dart';
import 'package:news/model/NewsResponces.dart';
import 'package:news/model/SourceResponse.dart';

class ApiManager {
/*
https://newsapi.org/v2/top-headlines/sources?apiKey=8826a2d0afc1436eb897d424f149b419
*/
  static Future<SourceResponse?> getSources() async {
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.sourceApi,
        {'apiKey': ApiConstants.apiKey});
    try {
      var response = await http.get(url);
      var responseBody = response.body; //todo: string
      //todo string => json
      var json = jsonDecode(responseBody); //todo: json
      //todo: json => object
      // SourceResponse.fromJson(jsonDecode(response.body)); // بديل السطور اللي قوق دي
      return SourceResponse.fromJson(json); //todo: object
    } catch (e) {
      throw e;
    }
  }

  static Future<NewsResponces?> getNewsBySourceId(String sourceId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.newsApi,
        {'apiKey': ApiConstants.apiKey, 'sources': sourceId});
    try {
      var response = await http.get(url);
      var responseBody = response.body; //todo: string
      //todo string => json
      var json = jsonDecode(responseBody); //todo: json
      //todo: json => object
      // SourceResponse.fromJson(jsonDecode(response.body)); // بديل السطور اللي قوق دي
      return NewsResponces.fromJson(json); //todo: object
    } catch(e){
      throw e;
    }
  }
}

/*
https://newsapi.org/v2/everything?q=bitcoin&apiKey=8826a2d0afc1436eb897d424f149b419
*/
