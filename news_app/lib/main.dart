import 'package:flutter/material.dart';
import 'package:news_app/first_screen.dart';
import 'package:news_app/forth_screen.dart';
import 'package:news_app/second_screen.dart';
import 'package:news_app/third_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ForthScreen());
    //home: FirstScreen());
    //home: ThirdScreen());
    //    home: SecondScreen());
  }
}
