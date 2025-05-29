import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/utils/icons/app_icons.dart';
import 'package:power_pro_app/core/utils/images/app_images.dart';
import 'package:power_pro_app/core/widgets/sizedbox_height.dart';
import 'package:power_pro_app/core/widgets/text_defulte.dart';
import 'package:power_pro_app/presentation/screens/more/widget/container_more_widget.dart';

class VideoPopupDialog extends StatelessWidget {
  const VideoPopupDialog({super.key});

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
                    Image.asset(
                      AppImages.ourVideos,
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.play_arrow, size: 32),
                        color: AppColor.white,
                      ),
                    ),
                  ],
                ),
              ),

              SizedboxHeight(h: 12),
              Slider(
                value: 0.2,
                onChanged: (v) {},
                activeColor: AppColor.white,
                inactiveColor: Colors.grey,
              ),

              SizedboxHeight(h: 12),

              Align(
                alignment: Alignment.centerLeft,
                child: TextDefulte(
                  data:
                      "How to Reduce Your Electricity Bill with Smart Devices",
                  size: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColor.textColor,
                ),
              ),
              SizedboxHeight(h: 8),
              TextDefulte(
                data:
                    "Lorem ipsum dolor sit amet, consectetur. Quam urna varius dis vivamus pretium. Tellus feugiat eu commodo bibendum nulla id platea hac suspendisse. Vitae valibutior turpis semper dui altrices felis sit. Aut arco mitos penatibus. Lorem ipsum dolor sit amet, consectetur. Quam urna varius dis vivamus pretium. Tellus feugiat eu commodo bibendum nulla id platea hac suspendisse. Vitae valibutior turpis semper dui altrices felis sit. Aut arco mitos penatibus. Lorem ipsum dolor sit amet, consectetur. Quam urna varius dis vivamus pretium. Tellus feugiat eu commodo bibendum nulla id platea hac suspendisse. Vitae valibutior turpis semper dui altrices felis sit. Aut arco mitos penatibus.",
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
