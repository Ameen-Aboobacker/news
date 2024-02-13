import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../data/blog_data.dart';

class BlogProvider extends ChangeNotifier {
  BlogList? news;
  getnews(int id) async {
    final response = await http.post(
      Uri.parse(
        'https://the-flutter-case-prod.noviindus.in/api/news-and-blogs-catg',
      ),
      body: {'category': id.toString()},
    );
    final data = jsonDecode(response.body);
    final newsList = BlogList.fromJson(data);
    news = newsList;
    notifyListeners();
  }
}
