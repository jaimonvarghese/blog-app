import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

import '../core/constants.dart';

class BlogService {
  static const String url = Url;
  static const String adminSecret = ADMIN_SECRET;

  static Future<List<dynamic>> fetchBlogs() async {
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {'x-hasura-admin-secret': adminSecret},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body)['blogs'];

        final box = Hive.box('blogs');
        await box.put('blogs', data);
        return data;
      } else {
        throw Exception('Failed to load blogs');
      }
    } catch (e) {
      final box = Hive.box('blogs');
      return box.get('blogs', defaultValue: []);
    }
  }
}
