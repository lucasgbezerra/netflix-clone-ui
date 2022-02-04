import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/themes/app_colors.dart';
import 'package:netflix_clone_ui/themes/app_text_styles.dart';

class CategorieListBanner extends StatelessWidget {
  const CategorieListBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
