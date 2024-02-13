import 'package:flutter/material.dart';

import '../../latest_news/news_screen.dart';

class NewsList extends StatelessWidget {
  const NewsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
                      itemBuilder: (context, index) => Padding(
    padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
    child: GestureDetector(
      onTap:(){
                   // Navigator.of(context).push(MaterialPageRoute(builder: (context) =>const NewsScreen())) ;
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
                      ),
                      itemCount: 5,
                    );
  }
}