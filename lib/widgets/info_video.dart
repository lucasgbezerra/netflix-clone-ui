import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone_ui/themes/app_colors.dart';
import 'package:netflix_clone_ui/themes/app_text_styles.dart';

class InfoMovie extends StatelessWidget {
  final bool isMovie;
  final bool isComplete;
  InfoMovie({Key? key, this.isMovie = false, this.isComplete = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(
          "2019",
          style: AppTextStyles.descriptionMovieText,
        ),
        Container(
          height: 20,
          width: 20,
          // Cor condizente com a classificação
          alignment: Alignment.center,
          color: Colors.black,
          child: Text(
            "18",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          isMovie ? "1h 58m" : "5 Seasons",
          style: AppTextStyles.descriptionMovieText,
        ),
        Container(
            child: isComplete
                ? Container(
                    height: 15,
                    width: 20,
                    color: AppColor.terciary,
                    alignment: Alignment.center,
                    child: Text(
                      "HD",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        color: AppColor.background,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  )
                : SizedBox()),
      ],
    );
  }
}
