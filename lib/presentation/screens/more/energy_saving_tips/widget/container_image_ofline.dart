import 'package:flutter/material.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/widgets/text_defulte.dart';

class ContainerImageOfline extends StatelessWidget {
  final String image;
  final bool? isInfinite;
  final double? width;
  final Function()? onTap;
  final String? title;
  const ContainerImageOfline({
    super.key,
    required this.image,
    this.isInfinite,
    this.width,
    this.onTap,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextDefulte(
                data: title ?? "",
                size: 18,
                fontWeight: FontWeight.w700,
                color: AppColor.textColor,
                maxLines: 1,
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(12), // Adds rounded corners to the image
              child: Image.asset(
                image, // Using Image.asset for local images
                fit: BoxFit.cover,
                width: isInfinite == true
                    ? double.infinity
                    : width ?? 200.0, // Ensures a default size if width is not provided
              ),
            ),
          ],
        ),
      ),
    );
  }
}
