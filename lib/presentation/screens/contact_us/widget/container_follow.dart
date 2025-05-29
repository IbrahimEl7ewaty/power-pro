import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';

class ContainerFollow extends StatelessWidget {
  final String icon;
  final VoidCallback? onPressed;
  const ContainerFollow({super.key, required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        color: AppColor.blue,
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: SvgPicture.asset(icon),
        color: AppColor.primaryBlack,
      ),
    );
  }
}
