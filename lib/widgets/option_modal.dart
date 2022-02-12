import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/themes/app_colors.dart';
import 'package:netflix_clone_ui/themes/app_text_styles.dart';

class OptionModal extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  const OptionModal(
      {Key? key, required this.icon, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Icon(
                icon,
                color: AppColor.secundary,
              ),
            ),
            Text(
              text,
              style: AppTextStyles.infoModalButton,
            )
          ],
        ),
      ),
    );
  }
}
