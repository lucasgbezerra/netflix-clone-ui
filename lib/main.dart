import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/screens/movie_screen.dart';
import 'package:netflix_clone_ui/screens/root_screen.dart';
import 'package:netflix_clone_ui/screens/search_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netflix Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MovieScreen(),
    );
  }
}
