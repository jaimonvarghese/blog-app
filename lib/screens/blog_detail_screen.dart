import 'package:blog_explorer/screens/widgets/favorite_button.dart';
import 'package:flutter/material.dart';

class BlogDetailScreen extends StatelessWidget {
  final Map<String, dynamic> blogData;

  const BlogDetailScreen({Key? key, required this.blogData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final favoritesBox = Hive.box('favorites');
    // final isFavorite = favoritesBox.containsKey(blog['id']);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(blogData['title']),
      ),
      body: Stack(
        children: [
          //background Image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    blogData['image_url'] != null
                        ? (blogData['image_url'])
                        : null,
                  ),
                ),
              ),
            ),
          ),
          //favorite button
          Positioned(
            right: 10,
            top: 300,
            child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(50)),
                child: FavoriteButton(blog: blogData)),
          ),
          //details
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: 380,
            child: Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
                color: Colors.black,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    blogData['title'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
