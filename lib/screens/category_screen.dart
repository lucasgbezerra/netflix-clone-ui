import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/models/genre.dart';
import 'package:netflix_clone_ui/repositories/video_repository.dart';
import 'package:netflix_clone_ui/themes/app_colors.dart';
import 'package:netflix_clone_ui/themes/app_text_styles.dart';
import 'package:netflix_clone_ui/widgets/loading_widgeet.dart';

class CategoryScreen extends ModalRoute {
  int? selectedCategory;
  final String defaultCategory;
  CategoryScreen({Key? key, required this.defaultCategory, this.selectedCategory});

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
    final _videoRepository = VideoRepository();

    return Container(
      padding: EdgeInsets.only(top: 80),
      child: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<Genre>>(
                future: _videoRepository.getGenres(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return LoadingWidget();
                  } else {
                    List<Genre> categories = snapshot.data!;

                    categories.insert(0, Genre(id: -1, name: defaultCategory));
                    return ListView.separated(
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop(categories[index]);
                          },
                          child: Text(
                            categories[index].name,
                            style: selectedCategory == categories[index].id ? AppTextStyles.selectedCategorytitleText :AppTextStyles.categorytitleText,
                            textAlign: TextAlign.center,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(
                        height: 20,
                      ),
                      itemCount: categories.length,
                    );
                  }
                }),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pop(Genre(id: -1, name: "Home"));
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
