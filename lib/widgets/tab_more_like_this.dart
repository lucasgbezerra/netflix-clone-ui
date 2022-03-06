import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/core/configurations.dart';
import 'package:netflix_clone_ui/repositories/video_repository.dart';
import 'package:netflix_clone_ui/widgets/loading_widgeet.dart';

class TabMoreLikeThis extends StatelessWidget {
  final int id;
  final Function(int) function;
  const TabMoreLikeThis({Key? key, required this.id, required this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final _videoRepository = VideoRepository();

    return FutureBuilder<List<Map<String, dynamic>>>(
      future: function(id),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LoadingWidget();
        } else {
          return Container(
            height:  ((width - 20) / 3) * 6 + 15,
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                mainAxisExtent: ((width - 20) / 3) * 1.5,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Map video = snapshot.data![index];
                return GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => TvshowDetailScreen(
                    //       Data.tvshowsAndTvShowInfo[0],
                    //     ),
                    //   ),
                    // );
                  },
                  child: Image.network(
                    "$imageBaseUrl$minImageSize${video['posterPath']}",
                    fit: BoxFit.fitHeight,
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
