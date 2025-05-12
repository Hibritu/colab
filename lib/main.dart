import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/category_news.dart';
import 'pages/onboarding.dart';
import 'services/data.dart';
import 'models/category_model.dart';
import 'models/article_model.dart';
import 'services/news.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Onboarding(), // Launches the Onboarding page
    );
  }
}