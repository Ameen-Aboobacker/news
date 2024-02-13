import 'package:flutter/material.dart';

import '../../data/blog_data.dart';

class NewsScreen extends StatelessWidget {
const NewsScreen({ Key? key, required this.blog }) : super(key: key);
final Results blog;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
         padding: const EdgeInsets.fromLTRB(15,0,15,8),
        child: ListView(
          
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.all(Radius.circular(15)),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 225,
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
          const SizedBox(height: 20,),
          Text(
            blog.title!,
            style:const  TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const  SizedBox(height: 20,),
            Text(
              'Updated:${blog.createdAt} ',style: const TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),
          const  SizedBox(height: 20,),
          const Text(
              '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent at risus vitae velit cursus viverra quis suscipit mauris. Praesent varius placerat justo vel pellentesque. Nullam porta sit amet mauris at gravida. Fusce semper tortor quis tortor fermentum, a vehicula mauris tincidunt. Donec in lorem eget odio blandit viverra in eu massa. Aliquam rhoncus, eros a euismod pharetra, orci elit rhoncus ex, non consectetur ligula erat ut odio. Proin sagittis in diam ut molestie. Sed sed libero accumsan, mattis sem eget, convallis dolor.

Interdum et malesuada fames ac ante ipsum primis in faucibus. Mauris et arcu eu purus facilisis dignissim non eget risus. Nullam vel feugiat ligula. Maecenas in erat nisl. Nullam nec fermentum sem, a vehicula sapien. Nunc urna nibh, vehicula sit amet mollis volutpat, feugiat sit amet dui. Donec sagittis ullamcorper purus, sollicitudin ullamcorper dolor tempor non. Vivamus sodales mauris sit amet sapien dignissim finibus.

Duis blandit tortor eu metus consequat, a sodales lorem tincidunt. Nullam quam metus, pellentesque vel eros quis, vehicula consequat nibh. Sed in odio sodales, facilisis felis ac, pretium magna. Nullam sed odio rhoncus, euismod ipsum ac, varius nunc. Nam dolor dui, venenatis non nisl non, bibendum venenatis tellus. Nullam velit mauris, porta ac ipsum id, euismod semper turpis. Suspendisse ac metus sed mauris pretium tristique et eget lacus. Lorem ipsum dolor sit amet, consectetur adipiscing elit.'''),
        ],
            ),

      ),
    );
  }
}