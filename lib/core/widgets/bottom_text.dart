import 'package:flutter/material.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/widgets/text_defulte.dart';

class BottomText extends StatelessWidget {
  final String data;
  final double size;
  final FontWeight fontWeight;
  final Color color;
  final bool isLoading;
  final VoidCallback? onPressed;

  const BottomText({
    super.key,
    required this.isLoading,
    required this.onPressed,
    required this.data,
    required this.size,
    required this.fontWeight,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: Ink(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColor.blueBlack, AppColor.blueWhite],
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child:
                isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : TextDefulte(
                      data: data,
                      size: size,
                      fontWeight: fontWeight,
                      color: color,
                    ),
          ),
        ),
      ),
    );
  }
}
