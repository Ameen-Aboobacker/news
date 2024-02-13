import 'package:flutter/material.dart';
import 'package:news/application/home/widgets/home_page.dart';
import 'package:news/application/home/provider/slider_provider.dart';
import 'package:provider/provider.dart';

import 'application/home/provider/blog_provider.dart';
import 'application/home/provider/category_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SliderProvider(),
        ),
         ChangeNotifierProvider(
          create: (context) => CategoryProvider(),
        ),
         ChangeNotifierProvider(
          create: (context) => BlogProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
