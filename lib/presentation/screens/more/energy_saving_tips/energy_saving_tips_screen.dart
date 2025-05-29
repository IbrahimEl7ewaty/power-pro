import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/utils/icons/app_icons.dart';
import 'package:power_pro_app/core/utils/images/app_images.dart';
import 'package:power_pro_app/core/widgets/box_learn_more.dart';
import 'package:power_pro_app/core/widgets/container_color_widget.dart';
import 'package:power_pro_app/core/widgets/line_border.dart';
import 'package:power_pro_app/core/widgets/sizedbox_height.dart';
import 'package:power_pro_app/core/widgets/text_defulte.dart';
import 'package:power_pro_app/presentation/screens/energy_consumption/widget/listview_practical_tips.dart';
import 'package:power_pro_app/presentation/screens/home/widget/send_message.dart';
import 'package:power_pro_app/presentation/screens/more/energy_saving_tips/improving_screen.dart';
import 'package:power_pro_app/presentation/screens/more/energy_saving_tips/widget/container_image.dart';
import 'package:power_pro_app/presentation/screens/more/energy_saving_tips/widget/improving_widget.dart';

class EnergySavingTipsScreen extends StatelessWidget {
  const EnergySavingTipsScreen({super.key});

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
                      TextDefulte(
                        data: 'Energy Saving Tips',
                        size: 24,
                        fontWeight: FontWeight.w700,
                        color: AppColor.textColor,
                      ),

                      SizedboxHeight(h: 20),
                      LineBorder(width: 100, height: 5),
                      SizedboxHeight(h: 20),
                      TextDefulte(
                        data:
                            "Discover practical and easy-to-implement energy-saving tips that can make a big difference. From reducing electricity usage at home to adopting sustainable habits, this section provides valuable insights to help you save energy, cut costs, and protect the environment. Start your journey toward smarter energy use today",
                        size: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColor.textColorHint,
                      ),
                      SizedboxHeight(h: 20),
                      ContainerImage(image: AppImages.energySaving),
                      SizedboxHeight(h: 20),

                      ImprovingWidget(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ImprovingScreen(),
                            ),
                          );
                        },
                      ),

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
                      TextDefulte(
                        data: 'Taking advantage of solar energy',
                        size: 16.82,
                        fontWeight: FontWeight.w900,
                        color: AppColor.textColor,
                      ),
                      SizedboxHeight(h: 20),
                      TextDefulte(
                        data:
                            "Advice: Installing solar panels can help generate electricity from clean and renewable sources.",
                        size: 16.13,
                        fontWeight: FontWeight.w400,
                        color: AppColor.textColor,
                      ),
                      SizedboxHeight(h: 20),
                      ContainerImage(image: AppImages.imageA),
                      SizedboxHeight(h: 20),
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
