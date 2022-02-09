import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone_ui/provider/data.dart';
import 'package:netflix_clone_ui/themes/app_colors.dart';
import 'package:netflix_clone_ui/themes/app_text_styles.dart';
import 'package:netflix_clone_ui/widgets/search_movie_tile.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.background,
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
            cursorHeight: 20,
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
              fillColor: AppColor.terciary,
              border: InputBorder.none,
            ),
          ),
        ),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(height: 5),
        itemCount: Data.moviesAndTvShowInfo.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: Text(
                "Top Searchs",
                style: GoogleFonts.roboto(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            );
          }

          return SearchMovieTile(Data.moviesAndTvShowInfo[index - 1]);
        },
      ),
    );
  }
}
