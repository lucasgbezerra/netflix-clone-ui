import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/themes/app_colors.dart';

class BottomNavBar extends StatelessWidget {
  final Function(int) onTap;
  int currentIndexPage;
  BottomNavBar({required this.currentIndexPage,required this.onTap, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: onTap,
        backgroundColor: AppColor.bottomNavBarBackground,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndexPage,
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
      );
  }
}