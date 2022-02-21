import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/models/popular_movies.dart';
import 'package:netflix_clone_ui/models/popular_tvshows.dart';
import 'package:netflix_clone_ui/provider/data.dart';
import 'package:netflix_clone_ui/repositories/video_repository.dart';
import 'package:netflix_clone_ui/screens/video_detail_screen.dart';
import 'package:netflix_clone_ui/themes/app_colors.dart';
import 'package:netflix_clone_ui/widgets/appBar_home.dart';
import 'package:netflix_clone_ui/widgets/bottom_appBar_home.dart';
import 'package:netflix_clone_ui/widgets/button_icon_text_horizontal.dart';
import 'package:netflix_clone_ui/widgets/button_icon_text_vertical.dart';
import 'package:netflix_clone_ui/widgets/category_list_banner.dart';
import 'package:netflix_clone_ui/widgets/continue_watching_video_list.dart';
import 'package:netflix_clone_ui/widgets/loading_widgeet.dart';
import 'package:netflix_clone_ui/widgets/video_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _videoRepository = VideoRepository();
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
                    ButtonIconTextVertical(
                      icon: Icons.add,
                      text: "My List",
                      onTap: () {},
                    ),
                    ButtonIconTextHorizontal(
                      text: "Play",
                      icon: Icons.play_arrow,
                      onPressed: () {},
                      size: Size(30, 35),
                    ),
                    ButtonIconTextVertical(
                      icon: Icons.info_outline,
                      text: "Info",
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
                    )
                  ],
                ),
                FutureBuilder<PopularMovies?>(
                  future: _videoRepository.getPopularMovies(1),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const LoadingWidget();
                    } else {
                      return VideoList(
                        title: "Movies",
                        height: 210,
                        width: 140,
                        videos: snapshot.data!.results,
                      );
                    }
                  },
                ),

                ContinueWatchingVideoList(movies: Data.imagesVideos),
               FutureBuilder<PopularTvshows?>(
                  future: _videoRepository.getPopularTvShows(1),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const LoadingWidget();
                    } else {
                      return VideoList(
                        title: "Tv Shows",
                        height: 210,
                        width: 140,
                        videos: snapshot.data!.results,
                      );
                    }
                  },
                ),
                  FutureBuilder<PopularMovies?>(
                  future: _videoRepository.getPopularMovieGenre("Action"),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const LoadingWidget();
                    } else {
                      return VideoList(
                        title: "Action Movies",
                        height: 210,
                        width: 140,
                        videos: snapshot.data!.results,
                      );
                    }
                  },
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
