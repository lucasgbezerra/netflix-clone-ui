import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/themes/app_colors.dart';
import 'package:netflix_clone_ui/widgets/appBar_home.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeScreen= MediaQuery.of(context).size;
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
          ],),
    body: Column(
      children: [
        // Trailer
        Container(
          height: sizeScreen.width*(9/16),
          color: Colors.red,
        ),
        SingleChildScrollView(
          
        )
      ],
      
      // 
    ),
    
    );
  }
}
