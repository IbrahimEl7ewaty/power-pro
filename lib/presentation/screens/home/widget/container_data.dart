import 'package:flutter/material.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/widgets/line_border.dart';
import 'package:power_pro_app/core/widgets/sizedbox_height.dart';
import 'package:power_pro_app/core/widgets/text_bottom_widget.dart';
import 'package:power_pro_app/core/widgets/text_defulte.dart';

class ContainerData extends StatelessWidget {
  final String data;
  final double size;
  final FontWeight fontWeight;
  final Color color;
  final String dataUnder;
  final double sizeUnder;
  final FontWeight fontWeightUnder;
  final Color colorUnder;
  final VoidCallback onPressed;

  const ContainerData({
    super.key,
    required this.data,
    required this.size,
    required this.fontWeight,
    required this.color,
    required this.dataUnder,
    required this.sizeUnder,
    required this.fontWeightUnder,
    required this.colorUnder,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 166,
      // height: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColor.offWhite,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextDefulte(
              data: data,
              size: size,
              fontWeight: fontWeight,
              color: color,
            ),
            const SizedboxHeight(h: 3),
            LineBorder(width: 30, height: 2),
            const SizedboxHeight(h: 5),
            TextDefulte(
              maxLines: 3,
              data: dataUnder,
              size: sizeUnder,
              fontWeight: fontWeightUnder,
              color: colorUnder,
            ),
            Spacer(),
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
                    color: AppColor.offWhite,
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
