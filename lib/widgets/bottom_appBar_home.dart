import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/provider/data.dart';
import 'package:netflix_clone_ui/screens/category_screen.dart';
import 'package:netflix_clone_ui/themes/app_colors.dart';
import 'package:netflix_clone_ui/themes/app_text_styles.dart';

class BottomAppBarHome extends StatelessWidget {
  const BottomAppBarHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
          onPressed: () {},
          child: Text(
            "TV Show",
            style: AppTextStyles.tabBarButtonsText,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "Movies",
            style: AppTextStyles.tabBarButtonsText,
          ),
        ),
        TextButton.icon(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                backgroundColor: Colors.black.withOpacity(0.9),
                
                builder: (context) => CategoryScreen());
          },
          icon: Text(
            "Categories",
            style: AppTextStyles.tabBarButtonsText,
          ),
          label: Icon(
            Icons.arrow_drop_down,
            color: AppColor.secundary,
          ),
        ),
      ],
    );
  }
}
