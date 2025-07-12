import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String videoPath;

  const VideoPlayerWidget({Key? key, required this.videoPath})
    : super(key: key);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _videoController;
  bool _isPlaying = false;
  late ValueNotifier<double> _videoProgressNotifier;
  bool _showPlayPauseIcon = false; // التحكم في إظهار الأيقونة

  @override
  void initState() {
    super.initState();
    _initializeVideo();
    _videoProgressNotifier = ValueNotifier<double>(0.0); // تهيئة المتغير هنا
  }

  // تهيئة مشغل الفيديو
  void _initializeVideo() {
    _videoController = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        _videoController.addListener(_videoListener);
        setState(() {}); // عندما يتم تحميل الفيديو بنجاح
      });
  }

  // الاستماع للتقدم في الفيديو
  void _videoListener() {
    if (_videoController.value.isInitialized) {
      _videoProgressNotifier.value =
          _videoController.value.position.inSeconds.toDouble();
    }
  }

  // تشغيل أو إيقاف الفيديو
  void _togglePlayPause() {
    setState(() {
      if (_isPlaying) {
        _videoController.pause(); // إيقاف الفيديو
      } else {
        _videoController.play(); // تشغيل الفيديو
      }
      _isPlaying = !_isPlaying; // تغيير الحالة
      _showPlayPauseIcon = false; // إخفاء الأيقونة بعد النقر
    });
  }

  // إظهار الأيقونة عند الضغط على الشاشة
  void _showIcon() {
    setState(() {
      _showPlayPauseIcon = true;
    });

    // إخفاء الأيقونة بعد 3 ثوانٍ من النقر
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _showPlayPauseIcon = false;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _videoProgressNotifier.dispose(); // تنظيف الـ Notifier
    _videoController.dispose(); // تنظيف مشغل الفيديو عند الخروج من الشاشة
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showIcon, // إظهار الأيقونة عند الضغط على الشاشة
      child:
          _videoController.value.isInitialized
              ? Stack(
                children: [
                  // عرض الفيديو
                  AspectRatio(
                    aspectRatio: _videoController.value.aspectRatio,
                    child: VideoPlayer(_videoController),
                  ),

                  // شريط التحكم أسفل الفيديو
                  Positioned(
                    bottom: 10,
                    left: 10,
                    right: 10,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: _togglePlayPause,
                          icon: Icon(
                            _isPlaying ? Icons.pause : Icons.play_arrow,
                            color: Colors.white,
                          ),
                        ),
                        Expanded(
                          child: ValueListenableBuilder<double>(
                            valueListenable: _videoProgressNotifier,
                            builder: (context, value, child) {
                              return VideoProgressIndicator(
                                _videoController,
                                allowScrubbing: true,
                                colors: VideoProgressColors(
                                  playedColor: Colors.blue,
                                  bufferedColor: Colors.grey,
                                  backgroundColor: Colors.black.withOpacity(
                                    0.5,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            _videoController.seekTo(
                              Duration.zero,
                            ); // إعادة الفيديو للبداية
                          },
                          icon: Icon(Icons.refresh, color: Colors.white),
                        ),
                      ],
                    ),
                  ),

                  // أيقونة التشغيل / الإيقاف تظهر فقط عند الضغط على الشاشة
                  if (_showPlayPauseIcon)
                    Positioned(
                      bottom: 90, // المسافة التي تحدد موقع الزر من أسفل الفيديو
                      left:
                          MediaQuery.of(context).size.width / 2 -
                          30, // تحديد الموقع الأفقي
                      child: GestureDetector(
                        onTap: _togglePlayPause,
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(
                              0.5,
                            ), // جعل الزر شفاف قليلاً
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            _isPlaying
                                ? Icons.pause
                                : Icons
                                    .play_arrow, // تغيير الأيقونة بناءً على حالة الفيديو
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                ],
              )
              : Center(child: CircularProgressIndicator()),
    );
  }
}
