import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/themes/app_colors.dart';
import 'package:netflix_clone_ui/themes/app_text_styles.dart';
import 'package:netflix_clone_ui/widgets/option_modal.dart';

class OptionsModalBottomSheet extends StatelessWidget {
  final int id;
  final String title;
  final bool isMovie;
  const OptionsModalBottomSheet(
      {Key? key, required this.title, required this.isMovie, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    return Container(
      height: sizeScreen.height * 0.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
        color: AppColor.modalBackground,
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.titleMovieText,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(
                  Icons.cancel_outlined,
                  color: AppColor.secundary,
                ),
              ),
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OptionModal(
                    icon: Icons.info_outline,
                    text: isMovie ? "Details & More" : "Episodes & Infos",
                    onTap: () {}),
                OptionModal(
                  icon: Icons.download,
                  text: isMovie ? "Download" : "Download Episode",
                  onTap: () {},
                ),
                OptionModal(
                  icon: Icons.thumb_up_alt,
                  text: "Rated",
                  onTap: () {},
                ),
                OptionModal(
                  icon: Icons.close,
                  text: "Remove From Row",
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
