import 'package:flutter/material.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/utils/images/app_images.dart';
import 'package:power_pro_app/core/widgets/sizedbox_height.dart';
import 'package:power_pro_app/core/widgets/text_defulte.dart';

class BoxOurBlog extends StatelessWidget {
  final String data;

  final String name;

  const BoxOurBlog({super.key, required this.data, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      width: 170,
      height: 180,
      decoration: BoxDecoration(
        color: AppColor.colorSendMessage,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(AppImages.powerProImage),
            ),
            SizedboxHeight(h: 5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextDefulte(
                data: data,
                size: 10,
                fontWeight: FontWeight.w700,
                color: AppColor.textColor,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextDefulte(
                    data: name,
                    size: 7,
                    fontWeight: FontWeight.w600,
                    color: AppColor.textColorHint,
                  ),
                  SizedboxHeight(h: 5),
                  TextDefulte(
                    data: "Apr 27th, 2022",
                    size: 7,
                    fontWeight: FontWeight.w600,
                    color: AppColor.blueBlack,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
