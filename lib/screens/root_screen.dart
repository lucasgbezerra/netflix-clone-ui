import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/screens/home_screen.dart';
import 'package:netflix_clone_ui/themes/app_colors.dart';
import 'package:netflix_clone_ui/themes/app_text_styles.dart';
import 'package:netflix_clone_ui/provider/data.dart';
import 'package:netflix_clone_ui/widgets/bottom_navBar.dart';
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
      bottomNavigationBar: BottomNavBar(
        onTap: (index) {
          //Troca de aba
          _pageController.jumpToPage(index);
          setState(() {
            _currentIndexPage = index;
          });
        },
       currentIndexPage: _currentIndexPage,
      ),
    );
  }
}
