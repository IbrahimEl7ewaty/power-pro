import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/utils/icons/app_icons.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;

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
    return Container(
      height: 75,
      decoration: BoxDecoration(
        color: Colors.transparent.withOpacity(0.5),
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
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          showUnselectedLabels: true,
          selectedItemColor: AppColor.blue,
          unselectedItemColor: AppColor.colorSendMessage,
          items: List.generate(5, (i) {
            return BottomNavigationBarItem(
              icon: SvgPicture.asset(
                iconsSvg[i],
                color:
                    _currentIndex == i
                        ? AppColor.blue
                        : AppColor.colorSendMessage,
              ),
              label: labelsIcons[i],
            );
          }),
        ),
      ),
    );
  }
}
