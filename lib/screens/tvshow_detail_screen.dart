import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone_ui/models/tvshow_detail.dart';
import 'package:netflix_clone_ui/provider/data.dart';
import 'package:netflix_clone_ui/themes/app_colors.dart';
import 'package:netflix_clone_ui/themes/app_text_styles.dart';
import 'package:netflix_clone_ui/widgets/appBar_home.dart';
import 'package:netflix_clone_ui/widgets/button_icon_text_horizontal.dart';
import 'package:netflix_clone_ui/widgets/button_icon_text_vertical.dart';
import 'package:netflix_clone_ui/widgets/info_video.dart';
import 'package:netflix_clone_ui/core/configurations.dart';

class TvshowDetailScreen extends StatefulWidget {
  final TvshowDetail tvshow;
  const TvshowDetailScreen(this.tvshow, {Key? key}) : super(key: key);

  @override
  State<TvshowDetailScreen> createState() => _TvshowDetailScreenState();
}

class _TvshowDetailScreenState extends State<TvshowDetailScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
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
                    '$imageBaseUrl$medImageSize${widget.tvshow.backdropPath}',
                  ),
                  fit: BoxFit.cover),
            ),
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
                          widget.tvshow.originalTitle,
                          style: AppTextStyles.titleMovieText,
                        ),
                      ),
                      InfoVideo(
                        showQuality: true,
                        ageRating: widget.tvshow.ageRating,
                        releaseDate: widget.tvshow.releaseDate,
                        seasons: widget.tvshow.numberOfSeasons,
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
                        widget.tvshow.overview,
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
                      "EPISODES",
                      style: TextStyle(fontSize: 12),
                    ),
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
                      ? ((100 * 9 / 16) + 38) * 8
                      : _controller.index == 1
                          ? ((sizeScreen.width - 20) / 3) * 6 + 15
                          : ((sizeScreen.width - 20) * (9 / 16) + 29) * 3 + 20,
                  padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                  child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: _controller,
                    children: [
                      // EPISODES
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 8,
                        itemBuilder: (context, index) {
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
                                        padding: const EdgeInsets.only(
                                            bottom: 8, right: 8),
                                        child: Container(
                                          height: 100 * 9 / 16,
                                          width: 100,
                                          color: Colors.red,
                                        ),
                                      ),
                                      Text.rich(
                                        TextSpan(
                                          text: "$index. Episode $index\n",
                                          style: GoogleFonts.roboto(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white),
                                          children: [
                                            TextSpan(
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
                                    "This space is to put the synopsis of the episode",
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
                      // Trailer tab bar
                      ListView.builder(
                        padding: EdgeInsets.all(10),
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        // separatorBuilder: (context, index)=>SizedBox(height: 10,),
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: (sizeScreen.width - 20) * (9 / 16),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.red,
                                    ),
                                    // padding: EdgfeInsets.only(bottom: 10),
                                  ),
                                  // Botão play
                                  // TODO: Transformar o botão de play em um widget

                                  Positioned.fill(
                                    child: Center(
                                      // alignment: Alignment.center,
                                      child: Container(
                                        height: 40,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.black.withOpacity(0.5),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned.fill(
                                    child: Center(
                                      // alignment: Alignment.center,
                                      child: Icon(
                                        Icons.play_circle_outline_outlined,
                                        size: 50,
                                        color: AppColor.secundary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 5, bottom: 10),
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
                      GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 5,
                          mainAxisExtent: ((sizeScreen.width - 20) / 3) * 1.5,
                        ),
                        itemCount: 12,
                        itemBuilder: (context, index) {
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
                            child: Image.asset(
                              Data.imagesVideos[index],
                              fit: BoxFit.fitHeight,
                              // height: (sizeScreen.width / 3) * 100 / 66,
                            ),
                          );
                          // return Container(color: Colors.grey,);
                        },
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
