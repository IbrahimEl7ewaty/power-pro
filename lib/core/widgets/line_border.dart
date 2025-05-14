import 'package:flutter/material.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';

class LineBorder extends StatelessWidget {
  final double width;
  final double height;
  const LineBorder({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColor.blue,
      ),
    );
  }
}
