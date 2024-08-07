import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class FavoriteButton extends StatelessWidget {
  final Map<String, dynamic> blog;
  const FavoriteButton({super.key, required this.blog});

  @override
  Widget build(BuildContext context) {
    final favoritesBox = Hive.box('favorites');
    final isFavorite = favoritesBox.containsKey(blog['id']);
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.white,
      ),
      onPressed: () {
        if (isFavorite) {
          favoritesBox.delete(blog['id']);
        } else {
          favoritesBox.put(blog['id'], blog);
        }

        (context as Element).reassemble();
      },
    );
  }
}
