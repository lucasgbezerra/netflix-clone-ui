import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/provider/data.dart';
import 'package:netflix_clone_ui/screens/video_detail_screen.dart';
import 'package:netflix_clone_ui/themes/app_colors.dart';
import 'package:netflix_clone_ui/themes/app_text_styles.dart';

class ContinueWatchingMovieList extends StatelessWidget {
  final List<String> movies;
  const ContinueWatchingMovieList({Key? key, required this.movies})
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
                          //TODO: Navegar para pagina do filme
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
                                image: AssetImage(
                                  movies[index],
                                ),
                              ),
                            ),
                            child: Stack(
                              children: [
                                // TODO: Transformar o botão de play em um widget
                                Center(
                                  child: Container(
                                    height: 60,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    child: Icon(
                                      Icons.play_circle_outline,
                                      color: AppColor.secundary,
                                      size: 80,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "S1:E4",
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => VideoDetailScreen(
                                      Data.moviesAndTvShowInfo[0],
                                    ),
                                  ),
                                );
                              },
                              child: Icon(
                                Icons.info_outline,
                                color: AppColor.secundary,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // TODO: Mostra opções
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
              itemCount: movies.length,
            ),
          )
        ],
      ),
    );
  }
}
