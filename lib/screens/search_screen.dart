import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone_ui/repositories/video_repository.dart';
import 'package:netflix_clone_ui/themes/app_colors.dart';
import 'package:netflix_clone_ui/themes/app_text_styles.dart';
import 'package:netflix_clone_ui/widgets/loading_widgeet.dart';
import 'package:netflix_clone_ui/widgets/search_video_tile.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String? search;
  late final VideoRepository _videoRepository;
  late final TextEditingController _textController;
  @override
  void initState() {
    _videoRepository = VideoRepository();
    // getTrendingVideos();
    _textController = TextEditingController();
    super.initState();
  }

  // void getTrendingVideos() async {
  //   videos = await _videoRepository.getTrendingVideos();
  //   setState(() {});
  // }

  // void getSearchVideos(String value, int page) async {
  //   videos = await _videoRepository.getSearchVideos(value, page);
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        backgroundColor: AppColor.background,
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: AppColor.secundary,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            iconSize: 30,
            icon: ClipRRect(
              child: Image.asset(
                "assets/avatars/profile_avatar_1.jpg",
                width: 30,
                height: 30,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size(screenSize.width, 30),
          child: TextField(
            controller: _textController,
            style: AppTextStyles.searchLabelText,
            cursorColor: Colors.white,
            cursorHeight: 20,
            decoration: InputDecoration(
              hintText: "Search for a movie, genre, etc.",
              hintStyle: AppTextStyles.searchHintText,
              focusedBorder: InputBorder.none,
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey[300],
              ),
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(Icons.mic),
                color: Colors.grey[300],
              ),
              filled: true,
              fillColor: AppColor.terciary,
              border: InputBorder.none,
            ),
            onSubmitted: (value) {
              search = value;
            },
          ),
        ),
      ),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: Text(
              "Top Searchs",
              style: GoogleFonts.roboto(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          FutureBuilder<List>(
              future: search == null
                  ? _videoRepository.getTrendingVideos()
                  : _videoRepository.getSearchVideos(search!, 1),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return LoadingWidget();
                } else {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    separatorBuilder: (context, index) => SizedBox(height: 5),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return SearchVideoTile(video: snapshot.data![index], isMovie: true);
                    },
                  );
                }
              }),
        ],
      ),
    );
  }
}
