import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:news/application/latest_news/latest_news_page.dart';
import 'package:news/application/latest_news/news_screen.dart';

import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../data/category_data.dart';
import '../provider/blog_provider.dart';

import '../provider/slider_provider.dart';
import 'package:http/http.dart' as http;

List colors = [
  Colors.black26,
  Colors.green,
  Colors.blue,
  Colors.amber,
  Colors.purple
];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   
  Future<List<BlogsCategory>?> getCategories() async {
    final response = await http.get(Uri.parse(
        'https://the-flutter-case-prod.noviindus.in/api/news-and-blogs'));

      final data = jsonDecode(response.body);
      final blogCategories = BlogCategories.fromJson(data);
      return blogCategories.blogsCategory;
    
    
  }
  @override
  void initState  () {
getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
 
    return FutureBuilder(future: getCategories(), builder:(context, snapshot) {
   
    if(snapshot.hasData){
     List<BlogsCategory>? categories=snapshot.data;
      return DefaultTabController(
      length: categories!.length,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'News & Blogs',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom:  TabBar(
              indicatorPadding:EdgeInsets.only(left: 19, right: 19),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Colors.green,
              isScrollable: true,
              labelColor: Colors.green,
              unselectedLabelColor: Colors.black38,
              tabs: categories.map((e) => Text(e.name!)).toList()),
        ),
        body: TabBarView(
          children:[
            TabPage(category: categories[0],),
            TabPage(category: categories[1],),
            TabPage(category: categories[2],),
            TabPage(category: categories[3],),
            TabPage(category: categories[4],),
            TabPage(category: categories[5],),
          ]
        
        ),
      ),
    );
    }
    return const Center(child:CircularProgressIndicator());
    }, );
  }
}

class TabPage extends StatelessWidget {
  const TabPage({
    super.key,
    required this.category,
  });
  final BlogsCategory category;
  @override
  Widget build(BuildContext context) {
    return Consumer<BlogProvider>(
      builder: (context, value, child) {
        value.getnews(category.id!);
        if (value.news == null || value.news!.count == 0) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Column(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CarouselSlider.builder(
                  itemCount: 5,
                  itemBuilder: (context, index, realIndex) {
                    return Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      color: colors[index],
                      child: Text(
                        category.name!,
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: 250,
                    viewportFraction: 1,
                    autoPlay: true,
                    onPageChanged: (index, reason) {
                      context.read<SliderProvider>().setIndex(index);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AnimatedSmoothIndicator(
                    activeIndex:
                        Provider.of<SliderProvider>(context).activeIndex,
                    count: 5,
                    effect: const WormEffect(
                      radius: 10,
                      dotWidth: 10,
                      dotHeight: 10,
                      activeDotColor: Colors.black,
                      dotColor: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '🔥Latest news',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const LatestNewsPage(),
                      ),
                    );
                  },
                  child: const Text('Read More'),
                ),
              ],
            ),
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, index) {
                final blog = value.news!.results![index];
                return Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => NewsScreen(blog: blog),
                      ));
                    },
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                  // image:DecorationImage(image: NetworkImage('https://the-flutter-case-prod.noviindus.in${blog.image}'))
                                ),
                                width: MediaQuery.of(context).size.width,
                                height: 123,
                                // color: Colors.black,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 12, 15),
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                child: Container(
                                  width: 78,
                                  height: 30,
                                  color: Colors.white,
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.timer,
                                        size: 22,
                                      ),
                                      Text(
                                        '20 min',
                                        style: TextStyle(fontSize: 12),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          blog.title!,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        const Text('ss'),
                      ],
                    ),
                  ),
                );
              },
              itemCount: value.news!.results!.length,
            ))
          ],
        );
      },
    );
  }
}
 
