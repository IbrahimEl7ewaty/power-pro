import 'package:flutter/material.dart';
import 'package:power_pro_app/core/utils/images/app_images.dart';

class BoxEnergySources extends StatelessWidget {
  final bool? isSelected;
  final Function()? onTap;
  const BoxEnergySources({super.key, this.isSelected = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      width: 180,
      height: 180,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          onTap: (isSelected ?? true) ? onTap : null,
          child: Image.asset(AppImages.energySources1, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
