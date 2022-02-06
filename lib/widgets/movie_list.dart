import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone_ui/themes/app_colors.dart';
import 'package:netflix_clone_ui/themes/app_text_styles.dart';

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
    final sizeScreen = MediaQuery.of(context).size;
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
                    //TODO: Adicionar navegador para pagina do filme
                    // Entrar na pagina do filme
                    showModalBottomSheet(
                        context: context,
                        backgroundColor: AppColor.modalBackground,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        )),
                        builder: (contex) {
                          return Container(
                            height: sizeScreen.height * 0.35,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.fromLTRB(10, 10, 10, 0),
                                      height: 160,
                                      width: 105,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        image: DecorationImage(
                                          image: AssetImage(
                                            movies[index],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 5),
                                            child: Text(
                                              "Title",
                                              style:
                                                  AppTextStyles.titleMovieText,
                                            ),
                                          ),
                                          Wrap(
                                            spacing: 5,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.center,
                                            children: [
                                              Text(
                                                "2019",
                                                style: AppTextStyles
                                                    .descriptionMovieText,
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
                                                style: AppTextStyles
                                                    .descriptionMovieText,
                                              ),
                                            ],
                                          ),
                                          Container(
                                            width: sizeScreen.width * 0.6,
                                            padding: EdgeInsets.fromLTRB(
                                                0, 8, 10, 10),
                                            child: Text(
                                              "Texto com o resumo do filme.Texto com o resumo do filme. Texto com o resumo do filme. Texto com o resumo do filme.",
                                              style: AppTextStyles
                                                  .descriptionMovieTextModal,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ElevatedButton.icon(
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.white,
                                            minimumSize: Size(
                                                sizeScreen.width * 0.4, 35)),
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
                                            style: AppTextStyles
                                                .descriptionMovieText,
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
                                            style: AppTextStyles
                                                .descriptionMovieText,
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(right: 5.0),
                                        child: Icon(
                                          Icons.info_outline,
                                          color: AppColor.secundary,
                                        ),
                                      ),
                                      Text(
                                        "Episodes & Info",
                                        style: GoogleFonts.roboto(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                        ),
                                      ),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                        Icon(Icons.navigate_next, color: AppColor.secundary,)
                                      ],),
                                    )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        });
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
