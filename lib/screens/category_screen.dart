import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/provider/data.dart';
import 'package:netflix_clone_ui/themes/app_colors.dart';
import 'package:netflix_clone_ui/themes/app_text_styles.dart';

class CategoryScreen extends ModalRoute {
  CategoryScreen({Key? key});

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
                  onTap: () {},
                  child: Text(
                    Data.categories[index],
                    style: AppTextStyles.categorytitleText,
                    textAlign: TextAlign.center,
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                height: 20,
              ),
              itemCount: Data.categories.length,
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
