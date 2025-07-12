import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:power_pro_app/presentation/screens/more/videos/data/model.dart';
import 'package:video_player/video_player.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/utils/icons/app_icons.dart';
import 'package:power_pro_app/core/widgets/sizedbox_height.dart';
import 'package:power_pro_app/core/widgets/text_defulte.dart';
import 'package:power_pro_app/presentation/screens/more/widget/container_more_widget.dart';

class VideoPopupDialog extends StatefulWidget {
  final Video video;  // Pass Video object containing video details

  const VideoPopupDialog({super.key, required this.video});

  @override
  _VideoPopupDialogState createState() => _VideoPopupDialogState();
}

class _VideoPopupDialogState extends State<VideoPopupDialog> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    // Initialize the video player controller with the passed videoUrl
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(widget.video.videoUrl!),
    );
    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(20),
      child: ContainerMoreWidget(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: SvgPicture.asset(
                      AppIcons.close,
                      color: AppColor.white,
                      width: 20,
                    ),
                  ),
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Video Player
                    FutureBuilder<void>(
                      future: _initializeVideoPlayerFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          // Video is ready to play
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                if (_controller.value.isPlaying) {
                                  _controller.pause();
                                } else {
                                  _controller.play();
                                }
                              });
                            },
                            child: AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: VideoPlayer(_controller),
                            ),
                          );
                        } else {
                          // Show loading indicator while video is loading
                          return Center(child: CircularProgressIndicator());
                        }
                      },
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            if (_controller.value.isPlaying) {
                              _controller.pause();
                            } else {
                              _controller.play();
                            }
                          });
                        },
                        icon: Icon(
                          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                          size: 32,
                        ),
                        color: AppColor.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedboxHeight(h: 12),
              Slider(
                value: _controller.value.position.inSeconds.toDouble(),
                max: _controller.value.duration.inSeconds.toDouble(),
                onChanged: (value) {
                  setState(() {
                    _controller.seekTo(Duration(seconds: value.toInt()));
                  });
                },
                activeColor: AppColor.white,
                inactiveColor: Colors.grey,
              ),
              SizedboxHeight(h: 12),
              Align(
                alignment: Alignment.centerLeft,
                child: TextDefulte(
                  data: widget.video.title!,
                  size: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColor.textColor,
                ),
              ),
              SizedboxHeight(h: 8),
              TextDefulte(
                data: "Lorem ipsum dolor sit amet, consectetur...",
                size: 8,
                fontWeight: FontWeight.w400,
                color: AppColor.textColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
