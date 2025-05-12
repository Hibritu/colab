import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/services/data.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/news.dart'; // Add this import for CategoryNews
import 'package:news_app/pages/category_news.dart';
import 'package:news_app/pages/article_view.dart';
import 'package:news_app/pages/onboarding.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<ArticleModel> articles = [];
  bool Loading = true;
@override
void initState() {
  categories = getCategories();
  getNews();
  super.initState();
}

void getNews() async {
  News news = News();
  await news.getNews();
  setState(() {
    articles = news.news;
    Loading = false;
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: IconButton(
      icon: Icon(Icons.arrow_back, color: Colors.blue),
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Onboarding()),
        );
      },
    ),
      ),
      body: SafeArea(

        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            margin: EdgeInsets.only(top: 40.0, bottom: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Buzz",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "line",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Text(
                "Hottest News",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 20.0),
              Container(
                height: MediaQuery.of(context).size.height / 1.6,
                child: ListView.builder(
                  itemCount: articles.length,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ArticlePage(url: articles[index].url!),
        ),
      );
    },
    child: Container(
      margin: EdgeInsets.only(right: 20.0),
      width: MediaQuery.of(context).size.width / 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: articles[index].urlToImage != null
                    ? Image.network(
                        articles[index].urlToImage!,
                        width: MediaQuery.of(context).size.width / 2,
                        height: 180,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 180,
                        color: Colors.grey[300],
                        child: Icon(Icons.image, size: 50),
                      ),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Text(
            articles[index].title ?? "No Title",
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 10.0),
          Text(
            articles[index].desc ?? "No Description",
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                fontSize: 15.0,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 10.0),
          Container(
            width: 80,
            height: 40,
            margin: EdgeInsets.only(top: 10.0),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
              ),
            ),
            child: Icon(
              Icons.arrow_forward,
              color: Colors.white,
              size: 30.0,
            ),
          ),
        ],
      ),
    ),
  );
},
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                "Explore",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w500),
              ),
              Container(
                height: 100,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return CategoryTile(
                      categoryName: categories[index].categoryName,
                      image: categories[index].image,
                    );
                  },
                ),
              ),
               
              Text(
                "Trending News",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 20.0),
              Container(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: articles.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),

                  itemBuilder: (BuildContext context, int index) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ArticlePage(url: articles[index].url!),
        ),
      );
    },
    child:  Container(
                margin: EdgeInsets.only(bottom:20.0,right: 20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  //borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                children:[
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                    ),
                    child: Image.network(
                      articles[index].urlToImage ?? "",
                      
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(children:[
                    Container(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                            
                                 articles[index].title ?? "No Title",
                                 maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              SizedBox(height: 20.0),
                              Container(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  articles[index].desc ?? "No Description",
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                  ])
                 
                ]),
              )
  );
},
                ),
              ),
             
            ],
          ),
        ),
        ),
      ),
    );
  }
}

// Move CategoryTile outside of _HomeState and make it a StatelessWidget
class CategoryTile extends StatelessWidget {
  final String? image;
  final String? categoryName;

   CategoryTile({Key? key, this.image, this.categoryName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the category news page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryNews(name: categoryName!),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 20.0),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Image.asset(
                image ?? "",
                width: 110,
                height: 110,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(60),
              ),
            ),
            Container(
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(60),
              ),
              child: Center(
                child: Text(
                  categoryName ?? "",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

