import 'package:flutter/material.dart';
import 'package:news_app/view/demo.dart';
import 'package:news_app/view/detail_screen.dart';
import 'package:news_app/view/home_screen.dart';

import 'package:news_app/view/splash_screen.dart';
import 'package:news_app/view/tabbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
