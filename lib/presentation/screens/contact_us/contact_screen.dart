import 'package:flutter/material.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/utils/icons/app_icons.dart';
import 'package:power_pro_app/core/widgets/container_color_widget.dart';
import 'package:power_pro_app/core/widgets/line_border.dart';
import 'package:power_pro_app/core/widgets/sizedbox_height.dart';
import 'package:power_pro_app/core/widgets/text_defulte.dart';
import 'package:power_pro_app/presentation/screens/contact_us/widget/bar_data.dart';
import 'package:power_pro_app/presentation/screens/contact_us/widget/container_data_widget.dart';
import 'package:power_pro_app/presentation/screens/contact_us/widget/container_follow.dart';
import 'package:power_pro_app/presentation/screens/home/widget/bottom_bar.dart';
import 'package:power_pro_app/presentation/screens/home/widget/send_message.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

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
                  SendMessage(height: 30),
                  ContainerDataWidget(
                    icon: AppIcons.call,
                    title: "Phone Number",
                    text: "+2010-1793-3654",
                  ),
                  SizedboxHeight(h: 15),
                  ContainerDataWidget(
                    icon: AppIcons.email,
                    title: "Email",
                    text: "powerpro@gmail.com",
                  ),
                  SizedboxHeight(h: 15),
                  ContainerDataWidget(
                    icon: AppIcons.location,
                    title: "Location Title",
                    text: "1930 Marigold Street, Miami, Florida, United States",
                  ),
                  SizedboxHeight(h: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          TextDefulte(
                            data: 'Follow us',
                            size: 24,
                            fontWeight: FontWeight.w700,
                            color: AppColor.textColor,
                          ),
                          const SizedboxHeight(h: 20),

                          SizedBox(
                            width: 140,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ContainerFollow(
                                  onPressed: () {},
                                  icon: AppIcons.twitter,
                                ),
                                ContainerFollow(
                                  onPressed: () {},
                                  icon: AppIcons.facebook,
                                ),
                                ContainerFollow(
                                  onPressed: () {},
                                  icon: AppIcons.instagram,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedboxHeight(h: 40),
                  TextDefulte(
                    data: 'Frequently Asked Questions',
                    size: 24,
                    fontWeight: FontWeight.w700,
                    color: AppColor.textColor,
                  ),
                  SizedboxHeight(h: 20),
                  LineBorder(width: 100, height: 5),
                  SizedboxHeight(h: 20),
                  ExpandableBarData(
                    title: "Who is Power pro?",
                    icon: AppIcons.showMore,
                    content:
                        "is sit. Aut arco mitos penatibus. Lorem ipsum dolor sit amet, consectetur. Quam urna varius dis vivamus pretium. Tellus feugiat eu commodo bibendum nulla id platea hac suspendisse. Vitae valibutior turpis semper dui altrices felis sit. Aut arco mitos penatibus. Lorem ipsum dolor sit amet, consectetur. Quam urna varius dis vivamus pretium. Tellus feugiat eu commodo bibendum nulla id platea hac suspendisse. Vitae valibutior turpis semper dui altrices felis sit. Aut arco mitos penatibus.",
                  ),
                  ExpandableBarData(
                    title: "Why  Power pro?",
                    icon: AppIcons.showMore,
                    content:
                        "is sit. Aut arco mitos penatibus. Lorem ipsum dolor sit amet, consectetur. Quam urna varius dis vivamus pretium. Tellus feugiat eu commodo bibendum nulla id platea hac suspendisse. Vitae valibutior turpis semper dui altrices felis sit. Aut arco mitos penatibus. Lorem ipsum dolor sit amet, consectetur. Quam urna varius dis vivamus pretium. Tellus feugiat eu commodo bibendum nulla id platea hac suspendisse. Vitae valibutior turpis semper dui altrices felis sit. Aut arco mitos penatibus.",
                  ),
                  ExpandableBarData(
                    title: "What is  services at Power pro?",
                    icon: AppIcons.showMore,
                    content:
                        "is sit. Aut arco mitos penatibus. Lorem ipsum dolor sit amet, consectetur. Quam urna varius dis vivamus pretium. Tellus feugiat eu commodo bibendum nulla id platea hac suspendisse. Vitae valibutior turpis semper dui altrices felis sit. Aut arco mitos penatibus. Lorem ipsum dolor sit amet, consectetur. Quam urna varius dis vivamus pretium. Tellus feugiat eu commodo bibendum nulla id platea hac suspendisse. Vitae valibutior turpis semper dui altrices felis sit. Aut arco mitos penatibus.",
                  ),

                  SizedboxHeight(h: 80),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
