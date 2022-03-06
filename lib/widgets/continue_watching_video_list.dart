import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/models/movie.dart';
import 'package:netflix_clone_ui/themes/app_colors.dart';
import 'package:netflix_clone_ui/themes/app_text_styles.dart';
import 'package:netflix_clone_ui/widgets/button_play.dart';
import 'package:netflix_clone_ui/widgets/options_modal_bottom_sheet.dart';
import 'package:netflix_clone_ui/core/configurations.dart';
import 'package:netflix_clone_ui/widgets/video_info_modal.dart';

class ContinueWatchingVideoList extends StatelessWidget {
  final List videos;
  const ContinueWatchingVideoList({Key? key, required this.videos})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 15, 0, 10),
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Text(
              "Continue Watching for Lucas",
              style: AppTextStyles.listTitleText,
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            height: 250 + 2,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  height: 250,
                  width: 140,
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            backgroundColor: AppColor.modalBackground,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            )),
                            builder: (contex) => VideoInfoModal(
                                videoId: videos[index].id,
                                isMovie: videos[index] is Movie),
                          );
                        },
                        child: Container(
                            height: 210,
                            width: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              image: DecorationImage(
                                image: NetworkImage(
                                  "$imageBaseUrl$minImageSize${videos[index].posterPath}",
                                ),
                              ),
                            ),
                            child: Stack(
                              children: [
                                ButtonPlay(height: 60),
                                
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        videos[index] is Movie
                                            ? "2h 30m"
                                            : "S1:E4",
                                        style: AppTextStyles.movieMinutesText,
                                      ),
                                      SizedBox(
                                        height: 2,
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 140 * 0.7,
                                              color: Colors.red,
                                            ),
                                            Container(
                                              width: 140 * 0.3,
                                              color: Colors.grey,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )),
                      ),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppColor.bottomNavBarBackground,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  backgroundColor: AppColor.modalBackground,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  )),
                                  builder: (contex) => VideoInfoModal(
                                      videoId: videos[index].id,
                                      isMovie: videos[index] is Movie),
                                );
                              },
                              child: Icon(
                                Icons.info_outline,
                                color: AppColor.secundary,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Abrir modal com informações do video
                                showModalBottomSheet(
                                  context: context,
                                  backgroundColor: AppColor.modalBackground,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  )),
                                  builder: (contex) => OptionsModalBottomSheet(
                                    id: videos[index].id,
                                    title: videos[index].title,
                                    isMovie: videos[index] is Movie,
                                  ),
                                );
                              },
                              child: Icon(
                                Icons.more_vert,
                                color: AppColor.secundary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => Container(
                width: 8,
              ),
              itemCount: videos.length,
            ),
          )
        ],
      ),
    );
  }
}
