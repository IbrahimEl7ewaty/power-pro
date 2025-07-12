import 'package:flutter/material.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';

class CustomForm extends StatelessWidget {
  final String? hint;
  final double? height;
  final bool largText;
  final TextEditingController? controller;

  const CustomForm({
    super.key,
    this.hint,
    this.height,
    this.largText = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 45,
      padding: const EdgeInsets.all(0.65),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColor.blueBlack, AppColor.blueWhite],
        ),
        borderRadius: BorderRadius.circular(5.24),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: AppColor.primaryWhite,
          borderRadius: BorderRadius.circular(5.24),
        ),
        child: TextFormField(
          controller: controller,
          keyboardType: largText ? TextInputType.multiline : TextInputType.text,
          maxLines: largText ? null : 1,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: AppColor.textColor,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: AppColor.textColorBlack,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
