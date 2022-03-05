import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/themes/app_colors.dart';

class AppbarVideoDetail extends StatelessWidget {
  const AppbarVideoDetail({Key? key}) : super(key: key);

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.background,
      leading: BackButton(
        color: AppColor.secundary,
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
