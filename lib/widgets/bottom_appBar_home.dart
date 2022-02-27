import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/provider/data.dart';
import 'package:netflix_clone_ui/screens/category_screen.dart';
import 'package:netflix_clone_ui/themes/app_colors.dart';
import 'package:netflix_clone_ui/themes/app_text_styles.dart';

class BottomAppBarHome extends StatefulWidget {
  const BottomAppBarHome({Key? key}) : super(key: key);

  @override
  State<BottomAppBarHome> createState() => _BottomAppBarHomeState();
}

class _BottomAppBarHomeState extends State<BottomAppBarHome> {
  int categoryId = -1;
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
          onPressed: () async {
            final category = await Navigator.of(context)
                .push(CategoryScreen(selectedCategory: categoryId));

            setState(() {
              categoryId = category;
            });
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
