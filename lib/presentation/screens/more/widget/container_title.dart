import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/widgets/text_defulte.dart';

class ContainerTitle extends StatelessWidget {
  final String data;
  final Function()? onTap;
  final String icon;
  final double? widthIcon;
  final double? heightIcon;
  const ContainerTitle({
    super.key,
    required this.data,
    this.onTap,
    required this.icon,
    this.widthIcon,
    this.heightIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            InkWell(
              onTap: onTap,
              child: Container(
                width: double.infinity,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        icon,
                        color: AppColor.blue,
                        width: widthIcon,
                        height: heightIcon,

                        fit: BoxFit.cover,
                      ),
                    ),
                    TextDefulte(
                      data: data,
                      size: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColor.textColor,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
