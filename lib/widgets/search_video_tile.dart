import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/themes/app_colors.dart';
import 'package:netflix_clone_ui/themes/app_text_styles.dart';
import 'package:netflix_clone_ui/core/configurations.dart';

class SearchVideoTile extends StatelessWidget {
  final dynamic video;
  final bool isMovie;
  const SearchVideoTile( {Key? key, required this.video,required  this.isMovie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: AppColor.modalBackground,
      child: Row(
        children: [
          video.backdropPath != null
              ? Image.network(
                  "$imageBaseUrl$medImageSize${video.backdropPath}",
                  fit: BoxFit.cover,
                  width: 80 * 227 / 127,
                )
              : Container(
                  width: 80 * 227 / 127,
                ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                video.title,
                overflow: TextOverflow.fade,
                style: AppTextStyles.infoModalButton,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.play_circle_outline,
                color: AppColor.secundary,
                size: 30,
              ),
            ),
          )
        ],
      ),
    );
  }
}
