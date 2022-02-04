import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/themes/app_colors.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Image.asset(
            "assets/logos/netflix_logo.png",
            height: 30,
          ),
        ),
        const Spacer(),
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
    );
  }
}
