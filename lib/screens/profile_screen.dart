import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/screens/root_screen.dart';
import 'package:netflix_clone_ui/themes/app_colors.dart';
import 'package:netflix_clone_ui/themes/app_text_styles.dart';
import 'package:netflix_clone_ui/provider/data.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Image.asset(
            "assets/logos/netflix_logo_full.png",
            scale: 2.5,
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
              },
              icon: const Icon(
                Icons.edit,
                color: AppColor.secundary,
              ),
            ),
          ]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Who's watching?",
              style: AppTextStyles.subTitleText,
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
                itemCount: Data.userData.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index < Data.userData.length) {
                    return Stack(
                      children: [
                        Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: GestureDetector(
                              onTap: () {
                                // Entrar no perfil
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RootScreen()));
                              },
                              child: Image.asset(
                                Data.userData[index]['image']!,
                                height: 100,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            Data.userData[index]['username']!,
                            style: AppTextStyles.headerText,
                          ),
                        )
                      ],
                    );
                  } else {
                    return GestureDetector(
                      onTap: (){
                        // Add Perfil
                      },
                      child: Stack(
                        children: [
                          const Center(
                            child: Icon(
                              Icons.add_circle,
                              color: AppColor.secundary,
                              size: 50,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              "Add Profile",
                              style: AppTextStyles.headerText,
                            ),
                          )
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
