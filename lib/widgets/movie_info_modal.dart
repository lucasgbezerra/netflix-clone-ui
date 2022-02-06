import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/themes/app_colors.dart';
import 'package:netflix_clone_ui/themes/app_text_styles.dart';

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
                      Wrap(
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
                            "5 Seasons",
                            style: AppTextStyles.descriptionMovieText,
                          ),
                        ],
                      ),
                      Container(
                        width: sizeScreen.width * 0.6,
                        padding: EdgeInsets.fromLTRB(0, 8, 10, 10),
                        child: Text(
                          "Texto com o resumo do filme.Texto com o resumo do filme. Texto com o resumo do filme. Texto com o resumo do filme.",
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
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      minimumSize: Size(sizeScreen.width * 0.4, 35)),
                  onPressed: () {},
                  icon: Icon(Icons.play_arrow),
                  label: Text("Play"),
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
          )
        ],
      ),
    );
  }
}