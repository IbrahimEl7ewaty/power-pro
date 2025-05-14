import 'package:flutter/material.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/utils/images/app_images.dart';
import 'package:power_pro_app/core/widgets/sizedbox_height.dart';
import 'package:power_pro_app/core/widgets/text_defulte.dart';

class BoxOurVideos extends StatelessWidget {
  final String data;
  const BoxOurVideos({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: 200,
      height: 260,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.transparent,
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  AppImages.ourVideos,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.play_arrow, size: 30),

                      color: AppColor.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedboxHeight(h: 10),
          TextDefulte(
            data: data,
            size: 15,
            fontWeight: FontWeight.w700,
            color: AppColor.textColor,
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}
