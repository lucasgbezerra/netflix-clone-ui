import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/themes/app_colors.dart';
import 'package:netflix_clone_ui/themes/app_text_styles.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.background,
        leading: BackButton(
          onPressed: () {},
          color: AppColor.secundary,
        ),
        actions: [
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
        bottom: PreferredSize(
          preferredSize: Size(screenSize.width, 30),
          child: TextField(
            style: AppTextStyles.searchLabelText,
            cursorColor: Colors.white,
            decoration: InputDecoration(
                hintText: "Search for a movie, genre, etc.",
                hintStyle: AppTextStyles.searchHintText,
                focusedBorder: InputBorder.none,
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey[300],
                ),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.mic),
                  color: Colors.grey[300],
                ),
                filled: true,
                fillColor: AppColor.terciary),
          ),
        ),
      ),
      body: Container(),
    );
  }
}
