import 'package:flutter/material.dart';
import 'package:blog_explorer/screens/blog_list_screen.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('favorites');
  await Hive.openBox('blogs');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blog Explorer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlogListScreen(),
    );
  }
}
