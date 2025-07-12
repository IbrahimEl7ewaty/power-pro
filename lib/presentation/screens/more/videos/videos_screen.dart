import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:power_pro_app/core/di/dependency_injection.dart';
import 'package:power_pro_app/core/network/api/api_service.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/utils/icons/app_icons.dart';
import 'package:power_pro_app/core/widgets/container_color_widget.dart';
import 'package:power_pro_app/core/widgets/line_border.dart';
import 'package:power_pro_app/core/widgets/sizedbox_height.dart';
import 'package:power_pro_app/core/widgets/text_defulte.dart';
import 'package:power_pro_app/presentation/screens/home/widget/send_message.dart';
import 'package:power_pro_app/presentation/screens/more/videos/data/model.dart';

import 'widget/gridview_viedo_widget.dart';
import 'widget/video_popup.dart';

class VideosScreen extends StatefulWidget {
  const VideosScreen({super.key});

  @override
  _VideosScreenState createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
  final ApiService _apiService = getIt<ApiService>();
  bool isLoading = true;
  List<Video> videos = [];

  @override
  void initState() {
    super.initState();
    _fetchVideos();
  }

  // Fetch videos from the API
  void _fetchVideos() async {
    try {
      final fetchedVideos = await _apiService.getVideoData();
      setState(() {
        videos = fetchedVideos;
        isLoading = false; // Hide loading spinner once data is fetched
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      // Handle error if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return ContainerColorWidget(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          extendBody: true,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: SvgPicture.asset(AppIcons.arrBack),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextDefulte(
                        data: "Our videos",
                        size: 24,
                        fontWeight: FontWeight.w700,
                        color: AppColor.textColor,
                      ),
                      SizedboxHeight(h: 20),
                      LineBorder(width: 100, height: 5),
                      SizedboxHeight(h: 20),
                      TextDefulte(
                        data:
                            "Explore inspiring and educational videos on energy conservation. Discover practical tips, innovative solutions, and success stories that show how we can all contribute to a more sustainable future.",
                        size: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColor.textColor,
                      ),
                      SizedboxHeight(h: 20),
                      isLoading
                          ? Center(
                            child: CircularProgressIndicator(),
                          ) // Show loading indicator while fetching
                          : GridView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: videos.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  mainAxisExtent: 300,
                                ),
                            itemBuilder: (context, index) {
                              final video = videos[index];
                              return GridViewViedoWidget(
                                onPressed: () {
                                  _showVideoDialog(video.id!);
                                }, // Show video details on tap
                                imagePath:
                                    video.thumbnailUrl ??
                                    "https://res.cloudinary.com/dsrv7czbc/image/upload/v1751768993/gasjucxnk1hafviwbtil.jpg", // Default image
                                titleVideo: video.title ?? "No Title",
                              );
                            },
                          ),
                      SendMessage(),
                      SizedboxHeight(h: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showVideoDialog(String videoId) async {
    final apiService = getIt<ApiService>();
    final video = await apiService.getVideoDetails(
      videoId, // Pass the video ID to fetch details
    ); // Fetch video details

    showDialog(
      context: context,
      builder:
          (context) => VideoPopupDialog(video: video), // Pass the Video object
    );
  }
}
