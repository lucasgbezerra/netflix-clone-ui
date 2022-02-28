import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/models/movie_detail.dart';
import 'package:netflix_clone_ui/repositories/video_repository.dart';
import 'package:netflix_clone_ui/screens/movie_detail_screen.dart';
import 'package:netflix_clone_ui/themes/app_colors.dart';
import 'package:netflix_clone_ui/widgets/button_icon_text_horizontal.dart';
import 'package:netflix_clone_ui/widgets/button_icon_text_vertical.dart';
import 'package:netflix_clone_ui/widgets/category_list_banner.dart';
import 'package:netflix_clone_ui/widgets/loading_widgeet.dart';
import 'package:netflix_clone_ui/core/configurations.dart';

class MovieBanner extends StatelessWidget {
  const MovieBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final _videoRepository = VideoRepository();

    return FutureBuilder<MovieDetail>(
        future: _videoRepository.getMovieBanner(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return LoadingWidget();
          } else {
            return Column(
              children: [
                Container(
                  height: screenSize.height * 0.66,
                  width: screenSize.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        "$imageBaseUrl$medImageSize${snapshot.data?.posterPath}",
                      ),
                      fit: BoxFit.cover,
                    ),
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
                CategoryListBanner(genres: snapshot.data!.genres),
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
                            builder: (context) => MovieDetailScreen(
                              snapshot.data!,
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ],
            );
          }
        });
  }
}
