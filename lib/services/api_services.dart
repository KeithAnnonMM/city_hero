import 'dart:convert';

import 'package:city_hero/models/article_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class ApiServices extends GetxController {
  static ApiServices instance = Get.find();
  final endPoint =
      "https://newsapi.org/v2/everything?q=keyword&apiKey=0da1aacca48840f78cfc11196811c6a4";

  Future<List<Article>> getArticle() async {
    final res = await get(Uri.parse(endPoint));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      List<dynamic> body = json['articles'];
      List<Article> articles =
          await body.map((dynamic e) => Article.fromJson(e)).toList();
      return articles;
    } else {
      Get.snackbar('Error', "Can't return articles");
      return [];
    }
  }
}
