import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/models/genre.dart';
import 'package:netflix_clone_ui/screens/category_screen.dart';
import 'package:netflix_clone_ui/themes/app_colors.dart';
import 'package:netflix_clone_ui/themes/app_text_styles.dart';

class BottomAppbarFilter extends StatefulWidget {
  Genre? category;
  final bool? isMovie;
  BottomAppbarFilter({Key? key, this.category, this.isMovie}) : super(key: key);

  @override
  State<BottomAppbarFilter> createState() => _BottomAppbarFilterState();
}

class _BottomAppbarFilterState extends State<BottomAppbarFilter> {
  Genre? actualCategory;
  @override
  void initState() {
    actualCategory =
        widget.category ?? Genre(id: -1, name: "All categories");
    super.initState();
  }

  void setActualCategory(){}
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        widget.isMovie != null
            ? TextButton.icon(
                onPressed: () async {
                  // Mover para lista de tipos
                },
                icon: Text(
                  widget.isMovie! ? "Movies" : "TV Shows",
                  style: AppTextStyles.tabBarButtonsText,
                ),
                label: Icon(
                  Icons.arrow_drop_down,
                  color: AppColor.secundary,
                ),
              )
            : Container(),
        TextButton.icon(
          onPressed: () async {
            final category = await Navigator.of(context).push(
              CategoryScreen(
                defaultCategory: "All categories",
                selectedCategory:
                   actualCategory!.id,
              ),
            );

            setState(() {
              actualCategory = category;
            });
          },
          icon: Text(
            actualCategory!.name,
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
