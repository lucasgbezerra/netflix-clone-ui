import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone_ui/themes/app_colors.dart';
import 'package:netflix_clone_ui/themes/app_text_styles.dart';

class InfoVideo extends StatelessWidget {
  final bool showQuality;
  final DateTime releaseDate;
  final String ageRating;
  final int? runtime;
  final int? seasons;
  InfoVideo(
      {Key? key,
      this.showQuality = false,
      required this.releaseDate,
      required this.ageRating,
      this.runtime,
      this.seasons})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(
          releaseDate.year.toString(),
          style: AppTextStyles.descriptionMovieText,
        ),
        Container(
          height: 20,
          // Cor condizente com a classificação
          alignment: Alignment.center,
          color: Colors.black,
          child: Text(
            ageRating,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          seasons == null ? formatRuntime(runtime!) : "$seasons Seasons",
          style: AppTextStyles.descriptionMovieText,
        ),
        Container(
            child: showQuality
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
                          fontWeight: FontWeight.w500),
                    ),
                  )
                : SizedBox()),
      ],
    );
  }

  String formatRuntime(int runtime){
    final duration = Duration(minutes: runtime);
    if (runtime < 60){
      return "${duration.inMinutes}m";
    }else{
      return "${duration.inHours}h ${duration.inMinutes - duration.inHours*60}m";
    }
  }
}
