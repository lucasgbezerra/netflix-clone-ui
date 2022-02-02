import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/themes/app_colors.dart';
import 'package:netflix_clone_ui/themes/app_text_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
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
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Image.asset(
            "assets/posters/dont_look_up_poster.jpg",
            opacity: const AlwaysStoppedAnimation<double>(0.9),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Comedy",
                  style: AppTextStyles.categoryHomeText,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Container(
                    height: 3,
                    width: 3,
                    decoration: const BoxDecoration(
                        color: AppColor.terciary, shape: BoxShape.circle),
                  ),
                ),
                Text("Drama", style: AppTextStyles.categoryHomeText),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Container(
                    height: 3,
                    width: 3,
                    decoration: const BoxDecoration(
                        color: AppColor.terciary, shape: BoxShape.circle),
                  ),
                ),
                Text("Sci-Fi", style: AppTextStyles.categoryHomeText)
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add),
                    color: AppColor.secundary,
                  ),
                  Text(
                    "My List",
                    style: AppTextStyles.userNameText,
                  )
                ],
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColor.secundary,
                ),
                onPressed: () {},
                child: SizedBox(
                  width: screenSize.width / 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.play_arrow,
                        color: AppColor.background,
                      ),
                      Text(
                        "Play",
                        style: AppTextStyles.buttonHomeText,
                      )
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.info_outline),
                    color: AppColor.secundary,
                  ),
                  Text(
                    "Info",
                    style: AppTextStyles.userNameText,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
