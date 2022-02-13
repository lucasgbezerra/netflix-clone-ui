import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone_ui/screens/video_detail_screen.dart';
import 'package:netflix_clone_ui/themes/app_colors.dart';
import 'package:netflix_clone_ui/themes/app_text_styles.dart';
import 'package:netflix_clone_ui/widgets/movie_info_modal.dart';

class MovieList extends StatelessWidget {
  final String title;
  final double height;
  final double width;
  final List<String> movies;
  const MovieList(
      {Key? key,
      required this.title,
      required this.height,
      required this.width,
      required this.movies})
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
              title,
              style: AppTextStyles.listTitleText,
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            height: height + 2,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
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
                      builder: (contex) =>
                          MovieInfoModal(poster: movies[index]),
                    );
                  },
                  child: Container(
                    height: height,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(
                          movies[index],
                        ),
                      ),
                    ),
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
