import 'package:flutter/material.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';

class ContainerBox extends StatelessWidget {
  final bool isChecked;
  final VoidCallback onTap;

  const ContainerBox({
    super.key,
    required this.isChecked,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // اضغط لتغيير الحالة
      child: Container(
        width: 18,
        height: 18,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: AppColor.blue,
            width: 1.2,
          ),
        ),
        child: isChecked
            ? const Center(
                child: Icon(
                  Icons.check,
                  size: 12,
                  color: AppColor.blue,
                ),
              )
            : null,
      ),
    );
  }
}
