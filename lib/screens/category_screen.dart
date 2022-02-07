import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/provider/data.dart';
import 'package:netflix_clone_ui/themes/app_text_styles.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Text(
              Data.categories[index],
              style: AppTextStyles.categorytitleText,
              textAlign: TextAlign.center,
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(
              height: 20,
            ),
        itemCount: Data.categories.length);
  }
}
