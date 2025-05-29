import 'package:flutter/material.dart';
import 'package:power_pro_app/core/utils/images/app_images.dart';

class BackgroundImage extends StatelessWidget {
  final Widget? child;
  final double? height;
  const BackgroundImage({super.key, this.child, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      height: height ?? 580,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(AppImages.backgroundImage),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
