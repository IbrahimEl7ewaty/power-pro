import 'package:flutter/material.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/widgets/sizedbox_height.dart';
import 'package:power_pro_app/core/widgets/text_defulte.dart';

class ImprovingEnergyWidget extends StatelessWidget {
  final String title;
  final String description;
  const ImprovingEnergyWidget({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColor.colorSendMessage,
      ),

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextDefulte(
              data: title,
              size: 15,
              fontWeight: FontWeight.w700,
              color: AppColor.textColor,
            ),
            SizedboxHeight(h: 20),
            TextDefulte(
              data: description,
              size: 12,
              fontWeight: FontWeight.w500,
              color: AppColor.textColor,
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }
}
