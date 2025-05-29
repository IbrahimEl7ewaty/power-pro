import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/widgets/sizedbox_height.dart';
import 'package:power_pro_app/core/widgets/text_defulte.dart';

class ContainerDataWidget extends StatelessWidget {
  final String icon;
  final String title;
  final String text;
  const ContainerDataWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.transparent.withOpacity(0.5),
        border: Border.all(color: AppColor.blue, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedboxHeight(h: 10),
            SvgPicture.asset(icon),
            SizedboxHeight(h: 15),
            TextDefulte(
              data: title,
              size: 17,
              fontWeight: FontWeight.w700,
              color: AppColor.blue,
              maxLines: 1,
            ),
            SizedboxHeight(h: 15),
            TextDefulte(
              data: text,
              size: 17,
              fontWeight: FontWeight.w700,
              color: AppColor.textColor,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
