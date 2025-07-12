import 'package:flutter/material.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/widgets/bottom_text_widget.dart';  // زرار مخصص

class CalculateButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onPressed;

  const CalculateButton({
    super.key,
    required this.isLoading,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return BottomTextWidget(
      onPressed: isLoading ? () {} : onPressed,  // لا يمكن الضغط إذا كانت العملية جارية
      data: isLoading ? 'Calculating...' : 'Calculate your consumption',  // نص الزر أثناء الحساب
      size: 14,
      fontWeight: FontWeight.w600,
      color: AppColor.primaryBlack,
      width: double.infinity,
    );
  }
}
