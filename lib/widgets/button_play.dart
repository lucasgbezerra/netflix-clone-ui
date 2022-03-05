import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/themes/app_colors.dart';

class ButtonPlay extends StatelessWidget {
  final double height;
  const ButtonPlay({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: height,
        width: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(height)),
          border: Border.all(
            width: 3,
            color: Colors.white,
            style: BorderStyle.solid,
          ),
          color: Colors.black.withOpacity(0.5)
        ),
        child: Center(
          child: Icon(
            Icons.play_arrow,
            color: AppColor.secundary,
            size: height/2,
          ),
        ),
      ),
    );
  }
}
