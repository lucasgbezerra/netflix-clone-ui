import 'package:flutter/material.dart';

import 'package:netflix_clone_ui/themes/app_colors.dart';
import 'package:netflix_clone_ui/themes/app_text_styles.dart';

class SeasonsScreen extends ModalRoute {
  final int numberOfSeasons;
  SeasonsScreen({
    required this.numberOfSeasons,
  });
  
    @override
  Color? get barrierColor => Colors.black.withOpacity(0.95);

  @override
  bool get barrierDismissible => false;

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  bool get opaque => false;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 50);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return Material(
      type: MaterialType.transparency,
      child: SafeArea(
        child: _buildOverlayContent(context),
      ),
    );
  }

  Widget _buildOverlayContent(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 80),
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop(index+1);
                  },
                  child: Text(
                    "Season ${index + 1}",
                    style: AppTextStyles.categorytitleText,
                    textAlign: TextAlign.center,
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                height: 20,
              ),
              itemCount: numberOfSeasons,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.cancel,
            ),
            color: AppColor.secundary,
            iconSize: 100,
          )
        ],
      ),
    );
  }
}
