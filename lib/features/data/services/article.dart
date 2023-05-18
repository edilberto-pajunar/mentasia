import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ArticleServices extends ChangeNotifier {
  bool isFetched = false;
  List<dynamic> articleList = [];

  static String url = "https://newsapi.org/v2/everything?q=keyword&capiKey=";
  static String apiKey = "067aee34cfb949b78082ca4263488880";
  final client = http.Client();

  /// fetch api from [newsApi]
  Future<dynamic> fetchArticleApi() async {
    final uri = Uri.parse(url);

    var headers = {
      "Authorization": "Bearer 067aee34cfb949b78082ca4263488880",
    };

    final response = await client.get(uri, headers: headers);

    if (response.statusCode == 200) {
      /// Request is succesful
      var body = response.body;
      final json = jsonDecode(body);
      articleList = json["articles"];
      isFetched = true;
      return articleList;
    } else if (response.statusCode == 403) {
      return CircularProgressIndicator();
    }

    notifyListeners();
  }
}
