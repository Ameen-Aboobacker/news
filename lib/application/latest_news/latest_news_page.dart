import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/application/home/widgets/news_list.dart';

class LatestNewsPage extends StatelessWidget {
const LatestNewsPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return  Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios_new),
        title: const Text('Latest News'),
      ),
      body:const NewsList()
      ,
    );
  }
}