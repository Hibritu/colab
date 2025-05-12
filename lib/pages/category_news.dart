import 'package:flutter/material.dart';
import 'package:news_app/models/show_category.dart' show ShowCategoryModel;
import 'package:news_app/services/show_category_news.dart' show ShowCategoryNews;
import 'package:news_app/pages/article_view.dart';
class CategoryNews extends StatefulWidget {
  String name;
  CategoryNews({ required this.name});

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}
class _CategoryNewsState extends State<CategoryNews> {
    List<ShowCategoryModel> categories = [];
    bool loading = true;
      @override 
    void initState() {
        getNews();
        super.initState();
    }
    getNews() async {
        ShowCategoryNews showCategoryNews = ShowCategoryNews();
        await showCategoryNews.getCategoryNews(widget.name.toLowerCase());
        categories = showCategoryNews.categories;
        setState(() {
            loading = false;
        });

    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.blue,
      appBar: AppBar(
          backgroundColor: Colors.blue,
      elevation: 0,
      ),
      
      body: Container(
        margin: EdgeInsets.only(top: 20),

        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[    
              Padding(
                padding: EdgeInsets.only(left:10),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white,),
                    ),
                    
                    
                    SizedBox(width: MediaQuery.of(context).size.width/3.8),
                    Text(
                      widget.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.0),

              Expanded(
                child: Container(
                
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  
                  child:    ListView.builder(
                    padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return CategoryTile(
                     
                      title: categories[index].title,
                      desc: categories[index].desc,
                       image: categories[index].urlToImage,
                       url: categories[index].url,
                    );
                  },
                ),
                ),
              ),
            ]
          ),

      ),

    );
  }
}

class CategoryTile extends StatelessWidget {
  final String? image, title, desc, url;

  const CategoryTile({Key? key, this.image, this.title, this.desc, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (url != null && url!.isNotEmpty) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ArticlePage(url: url!)),
          );
        }
      },
      child: Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 16.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: image != null && image!.isNotEmpty
                  ? Image.network(image!, errorBuilder: (context, error, stackTrace) => Container(height: 120, color: Colors.grey[300], child: const Icon(Icons.broken_image)))
                  : Container(height: 120, color: Colors.grey[300], child: const Icon(Icons.image)),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2,
              child: Text(
                title ?? "",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 5.0),
            Container(
              width: MediaQuery.of(context).size.width / 2,
              child: Text(
                desc ?? "",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

