import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/application/latest_news/latest_news_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'News & Blogs',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: const TabBar(
            indicatorPadding: EdgeInsets.only(left: 19, right: 19),
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.green,
            isScrollable: true,
            labelColor: Colors.green,
            unselectedLabelColor: Colors.black38,
            tabs: [
              Tab(
                text: 'All Feeds',
              ),
              Tab(
                text: "Market",
              ),
              Tab(
                text: "Cryptocurrency",
              ),
              Tab(
                text: "Wealth",
              ),
              Tab(
                text: "Banking",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              children: [
                Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.red,
                ),
                const SizedBox(
                  width: 20,
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
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
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
                                width: MediaQuery.of(context).size.width,
                                height: 123,
                                color: Colors.black,
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
                        const Text(
                          'This cyber security stock zooms 20% post buyback announcement',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        const Text(
                            'This cyber security stock zooms 20% post buyback announcement'),
                      ],
                    ),
                  ),
                  itemCount: 5,
                ))
              ],
            ),
            const Center(child: Text('market')),
            const Center(child: Text('market')),
            const Center(child: Text('market')),
            const Center(child: Text('market'))
          ],
        ),
      ),
    );
  }
}
