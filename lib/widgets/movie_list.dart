import 'package:flutter/material.dart';
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
            height: height+2,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    //TODO: Adicionar navegador para pagina do filme
                    // Entrar na pagina do filme
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
