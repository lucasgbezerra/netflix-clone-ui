import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/provider/data.dart';
import 'package:netflix_clone_ui/screens/video_detail_screen.dart';
import 'package:netflix_clone_ui/themes/app_colors.dart';
import 'package:netflix_clone_ui/themes/app_text_styles.dart';
import 'package:netflix_clone_ui/widgets/appBar_home.dart';
import 'package:netflix_clone_ui/widgets/bottom_appBar_home.dart';
import 'package:netflix_clone_ui/widgets/button_play.dart';
import 'package:netflix_clone_ui/widgets/category_list_banner.dart';
import 'package:netflix_clone_ui/widgets/continue_watching_video_list.dart';
import 'package:netflix_clone_ui/widgets/video_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: screenSize.height * 0.66,
                  width: screenSize.width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          "assets/posters/dont_look_up_poster.jpg",
                        ),
                        fit: BoxFit.cover),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColor.background.withOpacity(0.3),
                          AppColor.background.withOpacity(0.8)
                        ],
                      ),
                    ),
                  ),
                ),
                CategoryListBanner(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Icon(
                          Icons.add,
                          color: AppColor.secundary,
                        ),
                        Text(
                          "My List",
                          style: AppTextStyles.userNameText,
                        )
                      ],
                    ),
                    ButtonPlay(onPressed: (){}, size: Size(30, 35)),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VideoDetailScreen(
                              Data.moviesAndTvShowInfo[0],
                            ),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.info_outline,
                            color: AppColor.secundary,
                          ),
                          Text(
                            "Info",
                            style: AppTextStyles.userNameText,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                MovieList(
                  title: "My List",
                  height: 210,
                  width: 140,
                  movies: Data.imagesVideos,
                ),
                MovieList(
                  title: "Only on Netflix",
                  height: 300,
                  width: 200,
                  movies: Data.imagesVideos,
                ),
                ContinueWatchingMovieList(movies: Data.imagesVideos),
                MovieList(
                  title: "Trending Now",
                  height: 210,
                  width: 140,
                  movies: Data.imagesVideos,
                ),
                MovieList(
                  title: "TV Shows",
                  height: 210,
                  width: 140,
                  movies: Data.imagesVideos,
                ),
              ],
            ),
            SafeArea(
              child: Column(
                children: [
                  AppBarHome(),
                  BottomAppBarHome(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
