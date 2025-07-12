import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/utils/icons/app_icons.dart';
import 'package:power_pro_app/core/widgets/sizedbox_height.dart';
import 'package:power_pro_app/core/widgets/sizedbox_width.dart';
import 'package:power_pro_app/core/widgets/text_defulte.dart';

class TwxtWidget extends StatelessWidget {
  final String title;
  final String data;
  final bool isEdit;
  final Function()? onPress;
  const TwxtWidget({
    super.key,
    required this.title,
    required this.data,
    this.isEdit = true, this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextDefulte(
          data: title,
          size: 14,
          fontWeight: FontWeight.w500,
          color: AppColor.blue,
        ),
        SizedboxHeight(h: 15),
        GestureDetector(
          onTap: () {
            print("object");
          },
          child: Row(
            children: [
              TextDefulte(
                data: data,
                size: 12,
                fontWeight: FontWeight.w400,
                color: AppColor.textColor,
              ),
              const Spacer(),
              if (isEdit)
                GestureDetector(
                  onTap:onPress,
                  child: SvgPicture.asset(AppIcons.edit, color: AppColor.blue),
                ),

              SizedboxWidth(w: 8),
            ],
          ),
        ),
      ],
    );
  }
}
