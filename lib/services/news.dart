import 'package:news_app/models/article_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
      String url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=5e3c3af5ceeb43edbfb4c484f612b26c";

    var response = await http.get(Uri.parse(url));

    print(response.body); // <-- Add this line

    var jsonData = jsonDecode(response.body);
    if (jsonData["status"] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element["title"],
            desc: element["description"],
            urlToImage: element["urlToImage"],
            url: element["url"],
          );
          news.add(articleModel);
        }
      });
    }
  }
}