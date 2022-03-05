import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone_ui/core/configurations.dart';
import 'package:netflix_clone_ui/themes/app_colors.dart';
import 'package:netflix_clone_ui/widgets/button_play.dart';

class TabTrailer extends StatelessWidget {
  final String url;
  const TabTrailer({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: ((width - 20) * (9 / 16) + 32) * 1,
      child: ListView.builder(
        padding: EdgeInsets.all(10),
        physics: NeverScrollableScrollPhysics(),
        itemCount: 3,
        // separatorBuilder: (context, index)=>SizedBox(height: 10,),
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: (width - 20) * (9 / 16),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      '$imageBaseUrl$medImageSize$url',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: ButtonPlay(height: 50),
                // padding: EdgfeInsets.only(bottom: 10),
              ),
              // Botão play
              // TODO: Transformar o botão de play em um widget

              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                child: Text(
                  "Titulo trailer $index",
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
