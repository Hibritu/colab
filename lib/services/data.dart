import 'package:news_app/models/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = [];

  var categoryModel = CategoryModel();
  categoryModel.categoryName = "Business";
  categoryModel.image = "images/busines.png";
  category.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = "Entertainment";
  categoryModel.image = "images/entertainment.png";
  category.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = "Science";
  categoryModel.image = "images/science.png";
  category.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = "Sports";
  categoryModel.image = "images/sports.png";
  category.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = "Technology";
  categoryModel.image = "images/technology.png";
  category.add(categoryModel);

  return category;
}