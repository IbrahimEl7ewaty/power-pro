import 'package:flutter/material.dart';
import 'package:power_pro_app/core/utils/images/app_images.dart';

class BoxEnergySources extends StatelessWidget {
  const BoxEnergySources({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      width: 180,
      height: 180,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(AppImages.energySources, fit: BoxFit.cover),
      ),
    );
  }
}
