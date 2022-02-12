import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone_ui/provider/data.dart';
import 'package:netflix_clone_ui/themes/app_colors.dart';
import 'package:netflix_clone_ui/themes/app_text_styles.dart';
import 'package:netflix_clone_ui/widgets/appBar_home.dart';
import 'package:netflix_clone_ui/widgets/info_movie.dart';

class VideoDetailScreen extends StatefulWidget {
  final Map<String, String> movie;
  const VideoDetailScreen(this.movie, {Key? key}) : super(key: key);

  @override
  State<VideoDetailScreen> createState() => _VideoDetailScreenState();
}

class _VideoDetailScreenState extends State<VideoDetailScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
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
            color: Colors.red,
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
                          widget.movie["title"]!,
                          style: AppTextStyles.titleMovieText,
                        ),
                      ),
                      InfoMovie(
                        isComplete: true,
                        isMovie: true,
                      ),
                      SizedBox(height: 8),
                      ElevatedButton.icon(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            primary: AppColor.secundary,
                            minimumSize: Size(sizeScreen.width - 20, 50)),
                        icon: Icon(
                          Icons.play_arrow,
                          color: Colors.black,
                        ),
                        label: Text(
                          "Play",
                          style: AppTextStyles.iconLightButtonText,
                        ),
                      ),
                      SizedBox(height: 8),
                      ElevatedButton.icon(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            primary: AppColor.bottomNavBarBackground,
                            minimumSize: Size(sizeScreen.width - 20, 50)),
                        icon: Icon(
                          Icons.download,
                          color: Colors.white,
                        ),
                        label: Text(
                          "Download",
                          style: AppTextStyles.iconDarkButtonText,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Text about the movie or TvShow. Text about the movie or TvShow. Text about the movie or TvShow.",
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
                          Column(
                            children: [
                              Icon(
                                Icons.add,
                                color: AppColor.secundary,
                              ),
                              Text(
                                "My List",
                                style: AppTextStyles.userNameText,
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Icon(
                                Icons.thumb_up_alt_outlined,
                                color: AppColor.secundary,
                              ),
                              Text(
                                "Rate",
                                style: AppTextStyles.userNameText,
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Icon(
                                Icons.share,
                                color: AppColor.secundary,
                              ),
                              Text(
                                "Share",
                                style: AppTextStyles.userNameText,
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Icon(
                                Icons.download,
                                color: AppColor.secundary,
                              ),
                              Text(
                                "Download",
                                style: AppTextStyles.userNameText,
                              )
                            ],
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
                    Text("MORE LIKE THIS"),
                    Text("TRAILER & MORE"),
                  ],
                ),
                Container(
                  height: _controller.index == 0
                      ? ((sizeScreen.width - 20) / 3) * 6 + 15
                      : ((sizeScreen.width - 20) * (9 / 16) + 29)* 3 + 20,
                  padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                  child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: _controller,
                    children: [
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
                            onTap: () {},
                            child: Image.asset(
                              Data.imagesVideos[index],
                              fit: BoxFit.fitHeight,
                              // height: (sizeScreen.width / 3) * 100 / 66,
                            ),
                          );
                          // return Container(color: Colors.grey,);
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
                                    height:
                                        (sizeScreen.width - 20) * (9 / 16),
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
                                      child: Icon(
                                        Icons.play_circle_outline_outlined,
                                        size: 50,
                                        color: AppColor.secundary,
                                      ),
                                    ),
                                  )
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

//  TabBarView(
//                   children: [
//                     Container(color: Colors.red,),
//                     Container(color: Colors.blue,),
//                   ],
//                 ),

// GridView.builder(
//                         gridDelegate:
//                             SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 3,
//                           mainAxisSpacing: 5,
//                           crossAxisSpacing: 5,
//                         ),
//                         itemBuilder: (context, index) {
//                           return Image.asset(
//                             Data.imagesVideos[index],
//                             fit: BoxFit.cover,
//                             height: (sizeScreen.width / 3) * 100 / 66,
//                           );
//                         }),