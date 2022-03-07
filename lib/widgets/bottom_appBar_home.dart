import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/models/genre.dart';
import 'package:netflix_clone_ui/screens/category_screen.dart';
import 'package:netflix_clone_ui/screens/home_screen_with_filter.dart';
import 'package:netflix_clone_ui/themes/app_colors.dart';
import 'package:netflix_clone_ui/themes/app_text_styles.dart';

class BottomAppBarHome extends StatefulWidget {
  const BottomAppBarHome({Key? key}) : super(key: key);

  @override
  State<BottomAppBarHome> createState() => _BottomAppBarHomeState();
}

class _BottomAppBarHomeState extends State<BottomAppBarHome> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => HomeScreenWithFilter(
                  isMovie: false,
                ),
              ),
            );
          },
          child: Text(
            "TV Show",
            style: AppTextStyles.tabBarButtonsText,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => HomeScreenWithFilter(
                  isMovie: true,
                ),
              ),
            );
          },
          child: Text(
            "Movies",
            style: AppTextStyles.tabBarButtonsText,
          ),
        ),
        TextButton.icon(
          onPressed: () async {
            final Genre category = await Navigator.of(context).push(
                CategoryScreen(defaultCategory: "Home", selectedCategory: -1));

            if (category.id != -1) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => HomeScreenWithFilter(
                    category: category,
                  ),
                ),
              );
            }
            // setState(() {
            //   categoryId = category.id;
            //   categoryName = categoryName;
            // });
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
