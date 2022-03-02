import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/models/movie_detail.dart';
import 'package:netflix_clone_ui/models/movie.dart';
import 'package:netflix_clone_ui/models/tvshow_detail.dart';
import 'package:netflix_clone_ui/provider/data.dart';
import 'package:netflix_clone_ui/repositories/video_repository.dart';
import 'package:netflix_clone_ui/screens/movie_detail_screen.dart';
import 'package:netflix_clone_ui/screens/tvshow_detail_screen.dart';
import 'package:netflix_clone_ui/themes/app_colors.dart';
import 'package:netflix_clone_ui/themes/app_text_styles.dart';
import 'package:netflix_clone_ui/widgets/button_icon_text_horizontal.dart';
import 'package:netflix_clone_ui/widgets/info_video.dart';
import 'package:netflix_clone_ui/core/configurations.dart';
import 'package:netflix_clone_ui/widgets/loading_widgeet.dart';

import 'button_icon_text_vertical.dart';

class VideoInfoModal extends StatelessWidget {
  final int videoId;
  final bool isMovie;
  const VideoInfoModal({Key? key, required this.videoId, required this.isMovie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    final _videoRepository = VideoRepository();
    return Container(
      height: sizeScreen.height * 0.35,
      child: FutureBuilder<dynamic>(
        future: isMovie
            ? _videoRepository.getMovieDetail(videoId)
            : _videoRepository.getTvshowDetail(videoId),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return LoadingWidget();
          } else {
            return Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        height: 160,
                        width: 105,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            image: NetworkImage(
                              "$imageBaseUrl$minImageSize${snapshot.data?.posterPath}",
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Text(
                                snapshot.data!.originalTitle,
                                style: AppTextStyles.titleMovieText,
                                overflow: TextOverflow.fade,
                              ),
                            ),
                            // TODO: Obter infos do Movie/TvShow
                            InfoVideo(
                              ageRating: snapshot.data!.ageRating,
                              releaseDate: snapshot.data!.releaseDate,
                              runtime: isMovie ? snapshot.data.runtime : null,
                              seasons: !isMovie
                                  ? snapshot.data.numberOfSeasons
                                  : null,
                            ),
                            Container(
                              width: sizeScreen.width * 0.6,
                              padding: EdgeInsets.fromLTRB(0, 8, 10, 10),
                              child: Text(
                                snapshot.data!.overview,
                                style: AppTextStyles.descriptionMovieTextModal,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 7,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Icon(
                              Icons.cancel_outlined,
                              color: AppColor.secundary,
                            )),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonIconTextHorizontal(
                        text: "Play",
                        icon: Icons.play_arrow,
                        onPressed: () {},
                        size: Size(sizeScreen.width * 0.4, 35),
                      ),
                      ButtonIconTextVertical(
                        icon: Icons.download,
                        text: "Download",
                        onTap: () {},
                      ),
                      ButtonIconTextVertical(
                        icon: Icons.play_arrow_outlined,
                        text: "Preview",
                        onTap: () {},
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.play_arrow_outlined,
                            color: AppColor.secundary,
                          ),
                          Text(
                            "Preview",
                            style: AppTextStyles.descriptionMovieText,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: AppColor.terciary,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    onTap: () {
                      if (isMovie) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MovieDetailScreen(
                              snapshot.data,
                            ),
                          ),
                        );
                      }else{
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TvshowDetailScreen(
                              snapshot.data,
                            ),
                          ),
                        );
                      }
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: Icon(
                            Icons.info_outline,
                            color: AppColor.secundary,
                          ),
                        ),
                        Text(isMovie ? "Details & More" : "Episodes & Info",
                            style: AppTextStyles.infoModalButton),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.navigate_next,
                                color: AppColor.secundary,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}
