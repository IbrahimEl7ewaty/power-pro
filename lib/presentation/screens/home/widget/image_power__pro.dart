import 'package:flutter/material.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/utils/images/app_images.dart';
import 'package:power_pro_app/core/widgets/sizedbox_height.dart';
import 'package:power_pro_app/core/widgets/text_defulte.dart';

class ImagePowerPro extends StatelessWidget {
  final String dataTitle;
  final double sizeTitle;
  final FontWeight fontWeightTitle;
  final Color colorTitle;

  final String dataDesc;
  final double sizeDesc;
  final FontWeight fontWeightDesc;
  final Color colorDesc;
  const ImagePowerPro({
    super.key,
    required this.dataTitle,
    required this.sizeTitle,
    required this.fontWeightTitle,
    required this.colorTitle,
    required this.dataDesc,
    required this.sizeDesc,
    required this.fontWeightDesc,
    required this.colorDesc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      width: 170,
      height: 190,
      decoration: BoxDecoration(
        color: AppColor.blue,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              child: Image.asset(AppImages.powerProImage, fit: BoxFit.cover),
            ),
            SizedboxHeight(h: 10),
            TextDefulte(
              data: dataTitle,
              size: sizeTitle,
              fontWeight: fontWeightTitle,
              color: colorTitle,
            ),
            SizedboxHeight(h: 10),
            TextDefulte(
              data: dataDesc,
              size: sizeDesc,
              fontWeight: fontWeightDesc,
              color: colorDesc,
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }
}
