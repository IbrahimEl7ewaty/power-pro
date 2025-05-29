import 'package:flutter/material.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/widgets/text_defulte.dart';

class BoxLearnMore extends StatelessWidget {
  final Function()? onPressed;
  final double? width;
  final double? height;
  const BoxLearnMore({super.key, this.onPressed, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: width,
          height: height,

          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.transparent,
            border: Border.all(color: AppColor.blue, width: 1),
          ),
          child: Center(
            child: TextDefulte(
              data: 'Learn More',
              size: 8,
              fontWeight: FontWeight.w700,
              color: AppColor.blue,
            ),
          ),
        ),
      ),
    );
  }
}
