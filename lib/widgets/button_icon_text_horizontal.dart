import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/themes/app_colors.dart';
import 'package:netflix_clone_ui/themes/app_text_styles.dart';

class ButtonIconTextHorizontal extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final IconData icon;
  final Size size;
  final bool isDark;
  const ButtonIconTextHorizontal(
      {Key? key,
      required this.onPressed,
      required this.size,
      required this.text,
      required this.icon, this.isDark= false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: TextButton.styleFrom(
          backgroundColor: isDark ? AppColor.bottomNavBarBackground :AppColor.secundary, minimumSize: size),
      onPressed: onPressed,
      label: Text(
        text,
        style: isDark? AppTextStyles.iconDarkButtonText : AppTextStyles.buttonHomeText,
      ),
      icon: Icon(
        icon,
        color: isDark ? Colors.white : AppColor.background,
      ),
    );
  }
}