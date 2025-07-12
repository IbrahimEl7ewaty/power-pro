import 'package:flutter/material.dart';
import 'package:power_pro_app/core/network/api/api_consumer.dart';
import 'package:power_pro_app/core/network/api/api_service.dart';
import 'package:power_pro_app/core/network/cache/cache_helper.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/widgets/sizedbox_height.dart';
import 'package:power_pro_app/core/widgets/text_defulte.dart';
import 'package:power_pro_app/presentation/screens/more/videos/widget/video_popup.dart';

import '../../../../../core/di/dependency_injection.dart';

class GridViewViedoWidget extends StatelessWidget {
  final String imagePath;
  final String titleVideo;
  final void Function()? onPressed;
  const GridViewViedoWidget({
    super.key,
    required this.imagePath,
    required this.titleVideo,
    this.onPressed,
  });

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
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imagePath,
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
                      onPressed:onPressed,
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
            data: titleVideo,
            size: 15,
            fontWeight: FontWeight.w700,
            color: AppColor.textColor,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
