import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/themes/app_colors.dart';
import 'package:netflix_clone_ui/themes/app_text_styles.dart';

class SearchMovieTile extends StatelessWidget {
  final Map<String, String> movie;
  const SearchMovieTile(this.movie, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: AppColor.modalBackground,
      child: Row(
        children: [
          Image.asset(
            movie['image']!,
            fit: BoxFit.cover,
            width: 100,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              movie['title']!,
              style: AppTextStyles.infoModalButton,
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.play_circle_outline,
              color: AppColor.secundary,
              size: 30,
            ),
          )
        ],
      ),
    );
  }
}
