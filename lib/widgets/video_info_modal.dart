import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/provider/data.dart';
import 'package:netflix_clone_ui/screens/video_detail_screen.dart';
import 'package:netflix_clone_ui/themes/app_colors.dart';
import 'package:netflix_clone_ui/themes/app_text_styles.dart';
import 'package:netflix_clone_ui/widgets/button_play.dart';
import 'package:netflix_clone_ui/widgets/info_video.dart';

class MovieInfoModal extends StatelessWidget {
  final String poster;
  const MovieInfoModal({Key? key, required this.poster}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;

    return Container(
      height: sizeScreen.height * 0.35,
      child: Column(
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
                      image: AssetImage(
                        poster,
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
                          "Title",
                          style: AppTextStyles.titleMovieText,
                        ),
                      ),
                      InfoMovie(),
                      Container(
                        width: sizeScreen.width * 0.6,
                        padding: EdgeInsets.fromLTRB(0, 8, 10, 10),
                        child: Text(
                          "Text with movie synopsis. Text with movie synopsis. Text with movie synopsis. Text with movie synopsis.",
                          style: AppTextStyles.descriptionMovieTextModal,
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
                ButtonPlay(
                  onPressed: () {},
                  size: Size(sizeScreen.width * 0.4, 35),
                ),
                Column(
                  children: [
                    Icon(
                      Icons.download,
                      color: AppColor.secundary,
                    ),
                    Text(
                      "Download",
                      style: AppTextStyles.descriptionMovieText,
                    )
                  ],
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VideoDetailScreen(
                      Data.moviesAndTvShowInfo[0],
                    ),
                  ),
                );
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
                  Text("Episodes & Info", style: AppTextStyles.infoModalButton),
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
      ),
    );
  }
}
