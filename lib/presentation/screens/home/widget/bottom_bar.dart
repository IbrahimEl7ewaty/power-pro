import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/utils/icons/app_icons.dart';
import 'package:power_pro_app/presentation/screens/more/more_screen.dart'; // استيراد المور

final ValueNotifier<int> currentIndexNotifier = ValueNotifier<int>(0);

class BottomBar extends StatelessWidget {
  BottomBar({super.key});

  final labelsIcons = [
    'Home',
    'Energy consumption',
    'Blog',
    'Contact Us',
    'More',
  ];

  final iconsSvg = [
    AppIcons.home,
    AppIcons.energyConsumption,
    AppIcons.blog,
    AppIcons.contactUs,
    AppIcons.more,
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: currentIndexNotifier,
      builder: (context, currentIndex, _) {
        return Container(
          height: 75,
          decoration: BoxDecoration(
            color: Colors.transparent.withOpacity(0.3),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            border: Border.all(color: AppColor.blue, width: 1),
            boxShadow: [
              BoxShadow(
                color: AppColor.primaryBlack.withOpacity(0.8),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(labelsIcons.length, (i) {
                final isSelected = currentIndex == i;
                return GestureDetector(
                  onTap: () {
                    if (i == 4) {
                      showMoreBottomSheet(context); 
                    } 
                    else {
                      currentIndexNotifier.value = i;
                    }
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        iconsSvg[i],
                        color:
                            isSelected
                                ? AppColor.blue
                                : AppColor.colorSendMessage,
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        labelsIcons[i],
                        style: TextStyle(
                          color:
                              isSelected
                                  ? AppColor.blue
                                  : AppColor.colorSendMessage,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        );
      },
    );
  }
}
