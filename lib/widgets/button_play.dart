import 'package:flutter/material.dart';

class ButtonPlay extends StatelessWidget {
  final double height;
  const ButtonPlay({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black.withOpacity(0.5),
        ),
      ),
    );
  }
}
