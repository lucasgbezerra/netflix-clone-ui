import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/themes/app_colors.dart';
import 'package:netflix_clone_ui/themes/app_text_styles.dart';

class ButtonIconTextVertical extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  const ButtonIconTextVertical(
      {Key? key, required this.icon, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        child: Column(
          children: [
            Icon(
              icon,
              color: AppColor.secundary,
            ),
            Text(
              text,
              style: AppTextStyles.userNameText,
            )
          ],
        ),
      ),
    );
  }
}
