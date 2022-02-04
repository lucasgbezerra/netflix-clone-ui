import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/themes/app_colors.dart';
import 'package:netflix_clone_ui/themes/app_text_styles.dart';
import 'package:netflix_clone_ui/provider/data.dart';
import 'package:netflix_clone_ui/widgets/appBar_home.dart';
import 'package:netflix_clone_ui/widgets/bottom_appBar_home.dart';
import 'package:netflix_clone_ui/widgets/category_list_banner.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.background,
      // resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          ListView(
            children: [
              Container(
                height: screenSize.height * 0.66,
                width: screenSize.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/posters/dont_look_up_poster.jpg",
                      ),
                      fit: BoxFit.cover),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColor.background.withOpacity(0.3),
                        AppColor.background.withOpacity(0.8)
                      ],
                    ),
                  ),
                ),
              ),
              CategoryListBanner(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: const Icon(Icons.add),
                        color: AppColor.secundary,
                      ),
                      Text(
                        "My List",
                        style: AppTextStyles.userNameText,
                      )
                    ],
                  ),
                  ElevatedButton.icon(
                    style: TextButton.styleFrom(
                      backgroundColor: AppColor.secundary,
                    ),
                    onPressed: () {},
                    label: Text(
                      "Play",
                      style: AppTextStyles.buttonHomeText,
                    ),
                    icon: Icon(
                      Icons.play_arrow,
                      color: AppColor.background,
                    ),
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.info_outline),
                        color: AppColor.secundary,
                      ),
                      Text(
                        "Info",
                        style: AppTextStyles.userNameText,
                      )
                    ],
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 30, 0, 10),
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "MyList",
                      style: AppTextStyles.listTitleText,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 218,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              //TODO: Adicionar navegador para pagina do filme
                              // Entrar na pagina do filme
                            },
                            child: Container(
                              height: 210,
                              width: 140,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage(
                                    Data.imagesMovies[index],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => Container(
                          width: 8,
                        ),
                        itemCount: Data.imagesMovies.length,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          SafeArea(
            child: Column(
              children: [
                AppBarHome(),
                BottomAppBarHome(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          //Troca de aba
        },
        backgroundColor: AppColor.bottomNavBarBackground,
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        selectedItemColor: AppColor.secundary,
        unselectedItemColor: AppColor.terciary,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_esports_outlined),
            label: "Games",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library_outlined),
            label: "Coming Soon",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sentiment_very_satisfied_outlined),
            label: "Fast Laughs",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.download_for_offline_outlined),
            label: "Downloads",
          ),
        ],
      ),
    );
  }
}

class PersistentHeader extends SliverPersistentHeaderDelegate {
  final Widget? widget;

  PersistentHeader({this.widget});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.transparent,
      width: double.infinity,
      height: 56.0,
      child: Card(
        margin: EdgeInsets.all(0),
        color: Colors.transparent,
        elevation: 5.0,
        child: Center(child: widget),
      ),
    );
  }

  @override
  double get maxExtent => 56.0;

  @override
  double get minExtent => 56.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
