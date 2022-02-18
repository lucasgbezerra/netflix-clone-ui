import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/themes/app_colors.dart';
import 'package:netflix_clone_ui/themes/app_text_styles.dart';

class ButtonPlay extends StatelessWidget {
  final VoidCallback onPressed;
  final Size size;
  const ButtonPlay({Key? key, required this.onPressed, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: TextButton.styleFrom(
        backgroundColor: AppColor.secundary,
        minimumSize: size
      ),
      onPressed: onPressed,
      label: Text(
        "Play",
        style: AppTextStyles.buttonHomeText,
      ),
      icon: Icon(
        Icons.play_arrow,
        color: AppColor.background,
      ),
    );
  }
}
