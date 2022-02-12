import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/provider/data.dart';
import 'package:netflix_clone_ui/screens/video_detail_screen.dart';
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
      home: VideoDetailScreen(Data.moviesAndTvShowInfo[0]),
    );
  }
}
