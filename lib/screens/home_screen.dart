import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/themes/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(10),
          child: Image.asset(
            "assets/logos/netflix_logo.png",
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            iconSize: 30,
            icon: const Icon(
              Icons.search,
              color: AppColor.secundary,
            ),
          ),
          IconButton(
            onPressed: () {},
            iconSize: 30,
            icon: const Icon(
              Icons.tune,
              color: AppColor.secundary,
            ),
          ),
          IconButton(
            onPressed: () {},
            iconSize: 30,
            icon: ClipRRect(
              child: Image.asset(
                "assets/avatars/profile_avatar_1.jpg",
                width: 30,
                height: 30,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
          
          ),
        ],
      ),
    );
  }
}
