import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/themes/app_colors.dart';
import 'package:netflix_clone_ui/themes/app_text_styles.dart';
import 'package:netflix_clone_ui/provider/data.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Image.asset(
            "assets/logos/netflix_logo_full.png",
            scale: 2.5,
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                print((screenSize.width - 120) / 2);
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
              child: Flexible(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics:const  NeverScrollableScrollPhysics(),
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
                                onTap: (){
                                  // Entrar no perfil
                                },
                                child: Image.asset(
                                  Data.userData[index]['image']!,
                                  fit: BoxFit.scaleDown,
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
                      return Stack(
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
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
