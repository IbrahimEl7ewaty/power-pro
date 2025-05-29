import 'package:flutter/material.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/utils/images/app_images.dart';
import 'package:power_pro_app/core/widgets/sizedbox_height.dart';
import 'package:power_pro_app/core/widgets/text_defulte.dart';

class ListviewPracticalTips extends StatelessWidget {
  final String title;
  final String desc;
  final VoidCallback onPressed;

  const ListviewPracticalTips({
    super.key,
    required this.title,
    required this.desc,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      width: 200,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColor.primaryWhite,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                AppImages.powerProImage,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            TextDefulte(
              data: title,
              size: 11,
              fontWeight: FontWeight.w700,
              color: AppColor.textColorWhite,
            ),
            SizedboxHeight(h: 5),
            TextDefulte(
              data: desc,
              size: 8,
              fontWeight: FontWeight.w500,
              color: AppColor.textColorWhite,
              maxLines: 3,
            ),
            SizedboxHeight(h: 15),
            IntrinsicWidth(
              child: GestureDetector(
                onTap: onPressed,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.transparent,
                    border: Border.all(color: AppColor.blue, width: 1),
                  ),
                  child: TextDefulte(
                    data: 'Learn More',
                    size: 8,
                    fontWeight: FontWeight.w700,
                    color: AppColor.blue,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
