import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/utils/icons/app_icons.dart';
import 'package:power_pro_app/core/widgets/sizedbox_height.dart';
import 'package:power_pro_app/core/widgets/text_defulte.dart';

class ExpandableBarData extends StatefulWidget {
  final String title;
  final String icon;
  final String content;

  const ExpandableBarData({
    super.key,
    required this.title,
    required this.icon,
    required this.content,
  });

  @override
  State<ExpandableBarData> createState() => _ExpandableBarDataState();
}

class _ExpandableBarDataState extends State<ExpandableBarData> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: AppColor.primaryBlack,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColor.blue.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextDefulte(
                    data: widget.title,
                    size: 20,
                    fontWeight: FontWeight.w500,
                    color: AppColor.blue,
                  ),
                  isExpanded
                      ? SvgPicture.asset(AppIcons.showLess)
                      : SvgPicture.asset(AppIcons.showMore),
                ],
              ),
            ),
          ),
          if (isExpanded)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 8,
              ),
              child: TextDefulte(
                data: widget.content,
                size: 16,
                fontWeight: FontWeight.w400,
                color: AppColor.textColorHint,
              ),
            ),
         
        ],
      ),
    );
  }
}
