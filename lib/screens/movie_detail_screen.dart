import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone_ui/models/movie_detail.dart';
import 'package:netflix_clone_ui/repositories/video_repository.dart';
import 'package:netflix_clone_ui/themes/app_colors.dart';
import 'package:netflix_clone_ui/themes/app_text_styles.dart';
import 'package:netflix_clone_ui/widgets/button_icon_text_horizontal.dart';
import 'package:netflix_clone_ui/widgets/button_icon_text_vertical.dart';
import 'package:netflix_clone_ui/widgets/button_play.dart';
import 'package:netflix_clone_ui/widgets/info_video.dart';
import 'package:netflix_clone_ui/core/configurations.dart';
import 'package:netflix_clone_ui/widgets/tab_more_like_this.dart';
import 'package:netflix_clone_ui/widgets/tab_trailer.dart';

class MovieDetailScreen extends StatefulWidget {
  final MovieDetail movie;
  const MovieDetailScreen(this.movie, {Key? key}) : super(key: key);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _controller;
  late final VideoRepository _videoRepository;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
    _videoRepository = VideoRepository();
  }

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        backgroundColor: AppColor.background,
        leading: BackButton(
          color: AppColor.secundary,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            iconSize: 30,
            icon: const Icon(
              Icons.search,
              color: AppColor.secundary,
            ),
          ),
          IconButton(
            onPressed: () {},
            iconSize: 30,
            icon: ClipRRect(
              child: Image.asset(
                "assets/avatars/profile_avatar_1.jpg",
                width: 30,
                height: 30,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Trailer
          Container(
            height: sizeScreen.width * (9 / 16),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      '$imageBaseUrl$medImageSize${widget.movie.backdropPath}'),
                  fit: BoxFit.cover),
              
            ),
            child: ButtonPlay(height: 60),
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          widget.movie.originalTitle,
                          style: AppTextStyles.titleMovieText,
                        ),
                      ),
                      InfoVideo(
                        showQuality: true,
                        ageRating: widget.movie.ageRating ?? "TV-MA",
                        releaseDate: widget.movie.releaseDate,
                        runtime: widget.movie.runtime,
                      ),
                      SizedBox(height: 8),
                      ButtonIconTextHorizontal(
                        text: "Play",
                        icon: Icons.play_arrow,
                        onPressed: () {},
                        size: Size(sizeScreen.width - 20, 50),
                      ),
                      SizedBox(height: 8),
                      ButtonIconTextHorizontal(
                        text: "Download",
                        icon: Icons.download,
                        onPressed: () {},
                        size: Size(sizeScreen.width - 20, 50),
                        isDark: true,
                      ),
                      SizedBox(height: 8),
                      Text(
                        widget.movie.overview,
                        style: AppTextStyles.descriptionMovieText,
                      ),
                      GestureDetector(
                        onTap: () {
                          // Mostrar tela de todos os atores
                        },
                        child: Text.rich(
                          TextSpan(
                            text: "Starring: ",
                            style: GoogleFonts.roboto(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF757575),
                            ),
                            children: [
                              TextSpan(
                                text: "Dave Bautista, Omari Hardwick",
                                style: GoogleFonts.roboto(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF757575),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          text: "Director: ",
                          style: GoogleFonts.roboto(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF757575),
                          ),
                          children: [
                            TextSpan(
                              text: "Zack Snyder",
                              style: GoogleFonts.roboto(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF757575),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ButtonIconTextVertical(
                            icon: Icons.add,
                            text: "My List",
                            onTap: () {},
                          ),
                          ButtonIconTextVertical(
                            icon: Icons.thumb_up_alt_outlined,
                            text: "Rate",
                            onTap: () {},
                          ),
                          ButtonIconTextVertical(
                            icon: Icons.share,
                            text: "Share",
                            onTap: () {},
                          ),
                          ButtonIconTextVertical(
                            icon: Icons.download,
                            text: "Download",
                            onTap: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Divider(
                  thickness: 1,
                  color: AppColor.terciary,
                ),
                TabBar(
                  controller: _controller,
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(
                      color: AppColor.primary,
                      width: 5,
                    ),
                    insets: EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 22.0),
                  ),
                  padding: EdgeInsets.zero,
                  indicatorColor: AppColor.primary,
                  physics: NeverScrollableScrollPhysics(),
                  tabs: [
                    Text(
                      "TRAILER & MORE",
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      "MORE LIKE THIS",
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                Container(
                  height: _controller.index == 0
                      ? ((sizeScreen.width - 20) / 3) * 6 + 15
                      : ((sizeScreen.width - 20) * (9 / 16) + 29) * 3 + 20,
                  padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                  child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: _controller,
                    children: [
                      // Trailer tab bar
                      TabTrailer(
                        url: widget.movie.backdropPath,
                      ),
                      TabMoreLikeThis(
                        id: widget.movie.id,
                        function: _videoRepository.getMovieSimilar,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
