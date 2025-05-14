import 'package:flutter/material.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/utils/icons/app_icons.dart';
import 'package:power_pro_app/core/utils/images/app_images.dart';
import 'package:power_pro_app/core/widgets/bottom_text_widget.dart';
import 'package:power_pro_app/core/widgets/container_color_widget.dart';
import 'package:power_pro_app/core/widgets/line_border.dart';
import 'package:power_pro_app/core/widgets/sizedbox_height.dart';
import 'package:power_pro_app/core/widgets/text_bottom_widget.dart';
import 'package:power_pro_app/core/widgets/text_defulte.dart';
import 'package:power_pro_app/presentation/screens/home/widget/background_image.dart';
import 'package:power_pro_app/presentation/screens/home/widget/bottom_bar.dart';
import 'package:power_pro_app/presentation/screens/home/widget/box_energy_sources.dart';
import 'package:power_pro_app/presentation/screens/home/widget/box_our_blog.dart';
import 'package:power_pro_app/presentation/screens/home/widget/box_our_videos.dart';
import 'package:power_pro_app/presentation/screens/home/widget/container_data.dart';
import 'package:power_pro_app/presentation/screens/home/widget/image_power__pro.dart';
import 'package:power_pro_app/presentation/screens/home/widget/send_message.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ContainerColorWidget(
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
                    data:
                        'Take Control of Your Energy Consumption with Smart Predictions.',
                    size: 22.67,
                    fontWeight: FontWeight.w700,
                    color: AppColor.white,
                  ),
                  SizedboxHeight(h: 12),
                  TextDefulte(
                    data:
                        'Power Pro helps you optimize energy usage and reduce costs with cutting-edge predictive technology.',
                    size: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColor.textColorHint,
                  ),
                  SizedboxHeight(h: 20),
                  BottomTextWidget(
                    onPressed: () {},
                    data: 'Contact Us',
                    size: 10,
                    fontWeight: FontWeight.w700,
                    color: AppColor.primaryWhite,
                    sizeBox: 100,
                  ),
                  SizedboxHeight(h: 20),
                  Image.asset(AppImages.homePage),
                  SizedboxHeight(h: 20),
                  TextDefulte(
                    data: 'Who are we?',
                    size: 24,
                    fontWeight: FontWeight.w700,
                    color: AppColor.white,
                  ),
                  SizedboxHeight(h: 20),
                  LineBorder(height: 5, width: 100),
                  SizedboxHeight(h: 20),
                  TextDefulte(
                    data:
                        'Power Pro is a leading provider of energy management solutions, dedicated to helping businesses and individuals optimize their energy consumption and reduce costs.',
                    size: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColor.textColor,
                  ),
                  SizedboxHeight(h: 30),
                  Center(
                    child: TextDefulte(
                      data: 'Why Power pro?',
                      size: 24,
                      fontWeight: FontWeight.w600,
                      color: AppColor.white,
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

                  SizedboxHeight(h: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextDefulte(
                        data: 'Energy sources',
                        size: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColor.white,
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
                  TextDefulte(
                    data:
                        'Energy sources are the beating heart of our daily lives, playing a crucial role in powering our homes, businesses, and developing our communities. In this section of the Power Pro website, we explore all types of energy, from traditional sources like fossil fuels (coal, oil, and natural gas) to renewable energy sources (solar, wind, water, and geothermal energy).',
                    size: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColor.textColor,
                  ),
                  SizedboxHeight(h: 30),
                  SizedBox(
                    height: 220,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) => BoxEnergySources(),
                    ),
                  ),

                  SizedboxHeight(h: 30),
                  BackgroundImage(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedboxHeight(h: 15),
                          TextDefulte(
                            data: 'Energy-saving tips',
                            size: 24,
                            fontWeight: FontWeight.w600,
                            color: AppColor.textColor,
                          ),
                          SizedboxHeight(h: 15),
                          LineBorder(height: 5, width: 100),
                          SizedboxHeight(h: 40),
                          TextDefulte(
                            data:
                                "Discover simple, effective strategies to lower your energy consumption, cut costs, and contribute to a greener planet. From optimizing household appliances to adopting energy-efficient practices, these tips empower you to make a difference without sacrificing comfort.",
                            size: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColor.textColor,
                          ),
                          SizedboxHeight(h: 20),
                          GridView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 4,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  mainAxisExtent: 150,
                                ),
                            itemBuilder: (context, index) {
                              return ContainerData(
                                data: 'Rationalizing lighting consumption',
                                size: 9.11,
                                fontWeight: FontWeight.w700,
                                color: AppColor.primaryBlack,
                                dataUnder:
                                    "Use LED bulbs to save energy.Take advantage of natural lighting in your home.Tips for turning off unnecessary lights.",
                                sizeUnder: 8.74,
                                fontWeightUnder: FontWeight.w400,
                                colorUnder: AppColor.primaryWhite,
                                onPressed: () {
                                  print('object');
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedboxHeight(h: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextDefulte(
                        data: 'Our Blog',
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
                  TextDefulte(
                    data:
                        "Discover articles and tips on energy conservation in our blog. We help you adopt a sustainable lifestyle with innovative solutions and news on renewable energy. Stay updated and learn how to protect the environment and reduce energy use.",
                    size: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColor.textColor,
                  ),
                  SizedboxHeight(h: 20),
                  SizedBox(
                    height: 220,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder:
                          (context, index) => BoxOurBlog(
                            data: "10 Simple Tips to Save Energy at Home",
                            name: "Patricia Anderson",
                          ),
                    ),
                  ),

                  SizedboxHeight(h: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextDefulte(
                        data: 'Our Videos',
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
                  TextDefulte(
                    data:
                        "Explore inspiring and educational videos on energy conservation. Discover practical tips, innovative solutions, and success stories that show how we can all contribute to a more sustainable future. Enjoy rich and easy-to-understand content that makes energy saving a part of your daily life.",
                    size: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColor.textColor,
                  ),
                  SizedboxHeight(h: 5),
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder:
                          (context, index) => BoxOurVideos(
                            data: "10 Simple Tips to Save Energy at Home",
                          ),
                    ),
                  ),
                  TextDefulte(
                    data: 'Get in touch',
                    size: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColor.blue,
                  ),
                  SizedboxHeight(h: 10),
                  TextDefulte(
                    data: 'Reatch out to us for any help and inquiries',
                    size: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColor.textColor,
                  ),
                  SizedboxHeight(h: 20),
                  TextDefulte(
                    data: 'Our friendly team would love to hear from you.',
                    size: 12,
                    fontWeight: FontWeight.w700,
                    color: AppColor.textColor,
                  ),
                  SizedboxHeight(h: 20),
                  SendMessage(),
                  SizedboxHeight(h: 80),
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomBar(),
        ),
      ),
    );
  }
}
