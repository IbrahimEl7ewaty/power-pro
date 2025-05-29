import 'package:flutter/material.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';

class ContainerMoreWidget extends StatelessWidget {
  final Widget child;
  const ContainerMoreWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      //  height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        border: Border(top: BorderSide(color: AppColor.blue, width: 1)),

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
