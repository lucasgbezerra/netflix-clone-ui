import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone_ui/core/configurations.dart';
import 'package:netflix_clone_ui/models/episode.dart';
import 'package:netflix_clone_ui/models/season.dart';
import 'package:netflix_clone_ui/repositories/video_repository.dart';
import 'package:netflix_clone_ui/widgets/loading_widgeet.dart';

class TabEpisodes extends StatelessWidget {
  final int id;
  final int numOfSeason;
  const TabEpisodes({Key? key, required this.id, required this.numOfSeason}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _videoRepository = VideoRepository();
    return FutureBuilder<Season>(
      future: _videoRepository.getTvshowSeason(id, numOfSeason),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LoadingWidget();
        } else {
          return Container(
             height: (100*127/227 + 24 + 3*14) * snapshot.data!.episodes.length,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: snapshot.data!.episodes.length,
              itemBuilder: (context, index) {
                List<Episode> episodes = snapshot.data!.episodes;
                return InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8, right: 8),
                              child: Container(
                                height: 100 * 127 / 227,
                                width: 100,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        '$imageBaseUrl$medImageSize${episodes[index].stillPath}'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Text.rich(
                              TextSpan(
                                text:
                                    "${episodes[index].episodeNumber}. ${episodes[index].name}\n",
                                style: GoogleFonts.roboto(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                                children: [
                                  TextSpan(
                                    // TODO: Adicionar o runtime do ep
                                    text: "57m",
                                    style: GoogleFonts.roboto(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.download,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          episodes[index].overview,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.roboto(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
