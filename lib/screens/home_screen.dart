import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/models/movie.dart';
import 'package:netflix_clone_ui/models/tvshow.dart';
import 'package:netflix_clone_ui/provider/data.dart';
import 'package:netflix_clone_ui/repositories/video_repository.dart';
import 'package:netflix_clone_ui/screens/movie_detail_screen.dart';
import 'package:netflix_clone_ui/themes/app_colors.dart';
import 'package:netflix_clone_ui/widgets/appBar_home.dart';
import 'package:netflix_clone_ui/widgets/bottom_appBar_home.dart';
import 'package:netflix_clone_ui/widgets/button_icon_text_horizontal.dart';
import 'package:netflix_clone_ui/widgets/button_icon_text_vertical.dart';
import 'package:netflix_clone_ui/widgets/category_list_banner.dart';
import 'package:netflix_clone_ui/widgets/continue_watching_video_list.dart';
import 'package:netflix_clone_ui/widgets/loading_widgeet.dart';
import 'package:netflix_clone_ui/widgets/movie_banner.dart';
import 'package:netflix_clone_ui/widgets/video_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _videoRepository = VideoRepository();
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                MovieBanner(),
                FutureBuilder<List<Movie>>(
                  future: _videoRepository.getPopularMovies(1),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const LoadingWidget();
                    } else {
                      return VideoList(
                        title: "Movies",
                        height: 210,
                        width: 140,
                        videos: snapshot.data!,
                      );
                    }
                  },
                ),
                FutureBuilder<List>(
                  future: _videoRepository.getTrendingVideos(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const LoadingWidget();
                    } else {
                      return ContinueWatchingVideoList(videos: snapshot.data!);
                    }
                  },
                ),
                FutureBuilder<List<Tvshow>>(
                  future: _videoRepository.getPopularTvShows(1),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const LoadingWidget();
                    } else {
                      return VideoList(
                        title: "Tv Shows",
                        height: 210,
                        width: 140,
                        videos: snapshot.data!,
                      );
                    }
                  },
                ),
                FutureBuilder<List<Movie>>(
                  future: _videoRepository.getPopularMovieByGenre(18),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const LoadingWidget();
                    } else {
                      return VideoList(
                        title: "Action Movies",
                        height: 210,
                        width: 140,
                        videos: snapshot.data!,
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
