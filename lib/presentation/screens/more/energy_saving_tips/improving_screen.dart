import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/utils/icons/app_icons.dart';
import 'package:power_pro_app/core/utils/images/app_images.dart';
import 'package:power_pro_app/core/widgets/container_color_widget.dart';
import 'package:power_pro_app/core/widgets/sizedbox_height.dart';
import 'package:power_pro_app/core/widgets/text_bottom_widget.dart';
import 'package:power_pro_app/core/widgets/text_defulte.dart';
import 'package:power_pro_app/presentation/screens/energy_consumption/widget/listview_practical_tips.dart';
import 'package:power_pro_app/presentation/screens/home/widget/send_message.dart';
import 'package:power_pro_app/presentation/screens/more/energy_saving_tips/widget/container_image.dart';
import 'package:power_pro_app/presentation/screens/more/energy_saving_tips/widget/improving_widget.dart';

class ImprovingScreen extends StatelessWidget {
  const ImprovingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ContainerColorWidget(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          extendBody: true,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: SvgPicture.asset(AppIcons.arrBack),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ImprovingWidget(isShowMore: false, isLearningMore: false),

                      SizedboxHeight(h: 20),
                      TextDefulte(
                        data: "Avoid stress",
                        size: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColor.textColor,
                      ),
                      SizedboxHeight(h: 20),
                      TextDefulte(
                        data:
                            "Lorem ipsum dolor sit amet, consectetur. Quam urna varius dis vivamus pretium. Tellus feugiat eu commodo bibendum nulla id platea hac suspendisse. Vitae valibutior turpis semper dui altrices felis sit. Aut arco mitos penatibus. Lorem ipsum dolor sit amet, consectetur. Quam urna varius dis vivamus pretium. Tellus feugiat eu commodo bibendum nulla id platea hac suspendisse. Vitae valibutior turpis semper dui altrices felis sit. Aut arco mitos penatibus. Lorem ipsum dolor sit amet, consectetur. Quam urna varius dis vivamus pretium. Tellus feugiat eu commodo bibendum nulla id platea hac suspendisse. Vitae valibutior turpis semper dui altrices felis sit. Aut arco mitos penatibus.",
                        size: 12,
                        fontWeight: FontWeight.w700,
                        color: AppColor.textColor,
                      ),
                      SizedboxHeight(h: 20),
                      TextDefulte(
                        data:
                            "Discover articles and tips on energy conservation in our blog. We help you adopt a sustainable lifestyle with innovative solutions and news on renewable energy. Stay updated and learn how to protect the environment and reduce energy use.",
                        size: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColor.textColor,
                      ),
                      SizedboxHeight(h: 20),
                      ContainerImage(image: AppImages.imageA),
                      SizedboxHeight(h: 20),
                      ContainerImage(image: AppImages.energySaving2),
                      SizedboxHeight(h: 20),
                      TextDefulte(
                        data: "Avoid stress",
                        size: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColor.textColor,
                      ),
                      SizedboxHeight(h: 20),
                      TextDefulte(
                        data:
                            "Lorem ipsum dolor sit amet, consectetur. Quam urna varius dis vivamus pretium. Tellus feugiat eu commodo bibendum nulla id platea hac suspendisse. Vitae valibutior turpis semper dui altrices felis sit. Aut arco mitos penatibus. Lorem ipsum dolor sit amet, consectetur. Quam urna varius dis vivamus pretium. Tellus feugiat eu commodo bibendum nulla id platea hac suspendisse. Vitae valibutior turpis semper dui altrices felis sit. Aut arco mitos penatibus. Lorem ipsum dolor sit amet, consectetur. Quam urna varius dis vivamus pretium. Tellus feugiat eu commodo bibendum nulla id platea hac suspendisse. Vitae valibutior turpis semper dui altrices felis sit. Aut arco mitos penatibus.",
                        size: 12,
                        fontWeight: FontWeight.w700,
                        color: AppColor.textColor,
                      ),
                      SizedboxHeight(h: 20),
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
                      SizedboxHeight(h: 15),

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
                      SizedboxHeight(h: 30),
                      SendMessage(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
