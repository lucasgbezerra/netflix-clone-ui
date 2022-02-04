import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/screens/home_screen.dart';
import 'package:netflix_clone_ui/themes/app_colors.dart';
import 'package:netflix_clone_ui/themes/app_text_styles.dart';
import 'package:netflix_clone_ui/provider/data.dart';
import 'package:netflix_clone_ui/widgets/category_list_banner.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _currentIndexPage = 0;
  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          HomeScreen(),
          Container(
            color: AppColor.background,
            child: Center(
              child: Text(
                "Games",
                style: AppTextStyles.titleMovieText,
              ),
            ),
          ),
          Container(
            color: AppColor.background,
            child: Center(
              child: Text(
                "Coming Soon",
                style: AppTextStyles.titleMovieText,
              ),
            ),
          ),
          Container(
            color: AppColor.background,
            child: Center(
              child: Text(
                "Fast Laughs",
                style: AppTextStyles.titleMovieText,
              ),
            ),
          ),
          Container(
            color: AppColor.background,
            child: Center(
              child: Text(
                "Downloads",
                style: AppTextStyles.titleMovieText,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          //Troca de aba
          _pageController.jumpToPage(index);
          setState(() {
            _currentIndexPage = index;
          });
        },
        backgroundColor: AppColor.bottomNavBarBackground,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndexPage,
        selectedItemColor: AppColor.secundary,
        unselectedItemColor: AppColor.terciary,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Root",
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
