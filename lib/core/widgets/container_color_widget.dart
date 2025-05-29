import 'package:flutter/material.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';

class ContainerColorWidget extends StatelessWidget {
  final Widget child;
  const ContainerColorWidget({super.key, required this.child, });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,

      decoration: const BoxDecoration(
        
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColor.primaryBlack, AppColor.primaryWhite],
        ),
      ),
      child: child,
    );
  }
}
