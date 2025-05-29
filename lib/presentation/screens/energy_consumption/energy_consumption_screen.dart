import 'package:flutter/material.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/utils/images/app_images.dart';
import 'package:power_pro_app/core/widgets/container_color_widget.dart';
import 'package:power_pro_app/core/widgets/line_border.dart';
import 'package:power_pro_app/core/widgets/sizedbox_height.dart';
import 'package:power_pro_app/core/widgets/text_bottom_widget.dart';
import 'package:power_pro_app/core/widgets/text_defulte.dart';
import 'package:power_pro_app/presentation/screens/energy_consumption/widget/box_calculate.dart';
import 'package:power_pro_app/presentation/screens/energy_consumption/widget/listview_practical_tips.dart';
import 'package:power_pro_app/presentation/screens/home/widget/bottom_bar.dart';
import 'package:power_pro_app/presentation/screens/home/widget/image_power__pro.dart';
import 'package:power_pro_app/presentation/screens/home/widget/send_message.dart';

class EnergyConsumptionScreen extends StatelessWidget {
  const EnergyConsumptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ContainerColorWidget(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          extendBody: true,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextDefulte(
                    data: "Energy consumption",
                    size: 24,
                    fontWeight: FontWeight.w700,
                    color: AppColor.textColor,
                  ),
                  SizedboxHeight(h: 22),
                  LineBorder(width: 100, height: 5),
                  SizedboxHeight(h: 22),
                  TextDefulte(
                    data:
                        "Energy consumption is the use of natural resources to generate electricity and power devices. Your daily awareness contributes to environmental protection and cost reduction.",
                    size: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColor.textColorHint,
                  ),
                  SizedboxHeight(h: 15),
                  Container(width: 340, height: 340, color: AppColor.white),
                  SizedboxHeight(h: 25),
                  Center(
                    child: TextDefulte(
                      data: "Energy sources",
                      size: 24,
                      fontWeight: FontWeight.w700,
                      color: AppColor.textColor,
                    ),
                  ),
                  SizedboxHeight(h: 30),
                  SizedBox(
                    height: 220,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder:
                          (context, index) => ImagePowerPro(
                            dataTitle: "Comprehensive and integrated",
                            sizeTitle: 10,
                            fontWeightTitle: FontWeight.w700,
                            colorTitle: AppColor.primaryBlack,
                            dataDesc:
                                "Power Pro offers everything you need about energy in one place, from essential information on types of energy, to practical tips, and effective energy solutions.",
                            sizeDesc: 7,
                            fontWeightDesc: FontWeight.w500,
                            colorDesc: AppColor.primaryBlack,
                          ),
                    ),
                  ),
                  SizedboxHeight(h: 30),
                  TextDefulte(
                    data: "Energy Consumption Calculator",
                    size: 24,
                    fontWeight: FontWeight.w700,
                    color: AppColor.textColor,
                  ),
                  SizedboxHeight(h: 22),
                  LineBorder(width: 100, height: 5),
                  SizedboxHeight(h: 22),
                  TextDefulte(
                    data:
                        "The energy consumption calculator is an interactive tool that allows users to estimate the amount of energy consumed by electrical devices in their daily lives. This tool helps raise awareness about energy usage and reveals habits that may lead to excessive consumption.",
                    size: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColor.textColorHint,
                  ),
                  SizedboxHeight(h: 20),
                  BoxCalculate(),
                  SizedboxHeight(h: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextDefulte(
                        data: 'Practical tips ',
                        size: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColor.textColor,
                      ),
                      TextBottomWidget(
                        onPressed: () {},
                        data: 'See More',
                        size: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColor.blue,
                      ),
                    ],
                  ),
                  SizedboxHeight(h: 20),

                  SizedBox(
                    height: 260,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return ListviewPracticalTips(
                          title: "Benefit from smart applications",
                          desc:
                              "Tip: Using smart applications to monitor energy consumption and manage electrical appliances can help improve efficiency.",
                          onPressed: () {},
                        );
                      },
                    ),
                  ),

                  SizedboxHeight(h: 20),
                  SendMessage(),
                  // SizedboxHeight(h: 80),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
