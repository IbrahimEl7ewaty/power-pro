import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/utils/icons/app_icons.dart';
import 'package:power_pro_app/core/utils/images/app_images.dart';
import 'package:power_pro_app/core/widgets/container_color_widget.dart';
import 'package:power_pro_app/core/widgets/line_border.dart';
import 'package:power_pro_app/core/widgets/sizedbox_height.dart';
import 'package:power_pro_app/core/widgets/text_defulte.dart';
import 'package:power_pro_app/presentation/screens/home/widget/send_message.dart';
import 'package:power_pro_app/presentation/screens/more/videos/widget/gridview_viedo_widget.dart';

class VideosScreen extends StatelessWidget {
  const VideosScreen({super.key});

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
                            "Explore inspiring and educational videos on energy conservation. Discover practical tips, innovative solutions, and success stories that show how we can all contribute to a more sustainable future. Enjoy rich and easy-to-understand content that makes energy saving a part of your daily life.",
                        size: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColor.textColor,
                      ),
                      SizedboxHeight(h: 20),

                      GridView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 8,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          mainAxisExtent: 300,
                        ),
                        itemBuilder: (context, index) {
                          return GridviewViedoWidget(
                            imagePath: AppImages.ourVideos,
                            titleVideo: "10 Simple Tips to Save Energy at Home",
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
}
