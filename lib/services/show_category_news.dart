import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/show_category.dart';
import 'dart:convert';
class ShowCategoryNews{
    List<ShowCategoryModel> categories = [];
    Future<void> getCategoryNews(String category) async{
      String url = "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=5e3c3af5ceeb43edbfb4c484f612b26c";

      var response = await http.get(Uri.parse(url));
    print(response.body); // <-- Add this line

    var jsonData = jsonDecode(response.body);
    if (jsonData["status"] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          ShowCategoryModel showCategoryModel = ShowCategoryModel(
            title: element["title"],
            desc: element["description"],
            urlToImage: element["urlToImage"],
            url: element["url"],
          );
          categories.add(showCategoryModel);
        }
      });
    }

    }
    }