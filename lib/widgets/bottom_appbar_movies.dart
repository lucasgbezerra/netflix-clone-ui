import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/provider/data.dart';
import 'package:netflix_clone_ui/screens/category_screen.dart';
import 'package:netflix_clone_ui/screens/movies_screen.dart';
import 'package:netflix_clone_ui/themes/app_colors.dart';
import 'package:netflix_clone_ui/themes/app_text_styles.dart';

class BottomAppbarMovies extends StatefulWidget {
  const BottomAppbarMovies({Key? key}) : super(key: key);

  @override
  State<BottomAppbarMovies> createState() => _BottomAppbarMoviesState();
}

class _BottomAppbarMoviesState extends State<BottomAppbarMovies> {
  int categoryId = -1;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        TextButton.icon(
          onPressed: () async {
            // Mover para lista de tipos
          },
          icon: Text(
            "Movies",
            style: AppTextStyles.tabBarButtonsText,
          ),
          label: Icon(
            Icons.arrow_drop_down,
            color: AppColor.secundary,
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
            "All categories",
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
