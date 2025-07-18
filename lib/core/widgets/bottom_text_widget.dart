import 'package:flutter/material.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/widgets/text_defulte.dart';

class BottomTextWidget extends StatelessWidget {
  final String data;
  final double size;
  final FontWeight fontWeight;
  final Color color;
  final VoidCallback onPressed;
  final double? width;
  final double? height;

  const BottomTextWidget({
    super.key,
    required this.onPressed,
    required this.data,
    required this.size,
    required this.fontWeight,
    required this.color,
    this.width,
    this.height,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity, // لو مفيش width، خلي العرض يملأ الشاشة
      height: height ?? 40,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: Ink(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColor.blueBlack, AppColor.blueWhite],
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: TextDefulte(
              data: data,
              size: size,
              fontWeight: fontWeight,
              color: color,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
