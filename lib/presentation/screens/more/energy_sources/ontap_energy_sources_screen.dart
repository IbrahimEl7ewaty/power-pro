import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/utils/icons/app_icons.dart';
import 'package:power_pro_app/core/utils/images/app_images.dart';
import 'package:power_pro_app/core/widgets/bottom_text_widget.dart';
import 'package:power_pro_app/core/widgets/container_color_widget.dart';
import 'package:power_pro_app/core/widgets/line_border.dart';
import 'package:power_pro_app/core/widgets/sizedbox_height.dart';
import 'package:power_pro_app/core/widgets/text_defulte.dart';
import 'package:power_pro_app/presentation/screens/home/widget/background_image.dart';
import 'package:power_pro_app/presentation/screens/home/widget/send_message.dart';
import 'package:power_pro_app/presentation/screens/more/energy_saving_tips/widget/container_image.dart';
import 'package:power_pro_app/presentation/screens/more/energy_sources/widget/Improving_energy_widget.dart';

class OntapEnergySourcesScreen extends StatelessWidget {
  final String imageUrl;
  const OntapEnergySourcesScreen({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ContainerColorWidget(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          extendBody: true,
          body: SingleChildScrollView(
            child: Column(
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
                SizedboxHeight(h: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextDefulte(
                        data: "Energy sources",
                        size: 24,
                        fontWeight: FontWeight.w700,
                        color: AppColor.textColor,
                      ),

                      SizedboxHeight(h: 20),
                      LineBorder(width: 100, height: 5),
                      SizedboxHeight(h: 20),
                      TextDefulte(
                        data:
                            "Energy sources are the beating heart of our daily lives, playing a crucial role in powering our homes, businesses, and developing our communities. In this section of the Power Pro website, we explore all types of energy, from traditional sources like fossil fuels (coal, oil, and natural gas) to renewable energy sources (solar, wind, water, and geothermal energy).",
                        size: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColor.textColor,
                      ),
                      SizedboxHeight(h: 20),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          imageUrl,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                      SizedboxHeight(h: 20),
                      TextDefulte(
                        data: "How wind energy works",
                        size: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColor.textColor,
                      ),
                      SizedboxHeight(h: 10),
                      TextDefulte(
                        data:
                            "Wind turbines are used to convert the kinetic energy of the wind into electrical energy. When the wind pushes the turbine blades, an electric generator inside spins to produce power.",
                        size: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColor.textColor,
                      ),
                      SizedboxHeight(h: 20),
                      ContainerImage(image: AppImages.energyFan),
                      SizedboxHeight(h: 20),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextDefulte(
                              data: "Advantages of Wind Energy",
                              size: 20,
                              fontWeight: FontWeight.w700,
                              color: AppColor.textColor,
                            ),

                            SizedboxHeight(h: 20),
                            BottomTextWidget(
                              data:
                                  "A clean and environmentally friendly energy source.",
                              size: 20,
                              fontWeight: FontWeight.w700,
                              color: AppColor.primaryBlack,
                              onPressed: () {},
                              width: double.infinity,
                              height: 60,
                            ),

                            SizedboxHeight(h: 20),
                            BottomTextWidget(
                              data:
                                  "Low operating costs once the turbines are installed.",
                              size: 20,
                              fontWeight: FontWeight.w700,
                              color: AppColor.primaryBlack,
                              onPressed: () {},
                              width: double.infinity,
                              height: 60,
                            ),

                            SizedboxHeight(h: 20),
                            BottomTextWidget(
                              data: "Reduces dependence on fossil fuels.",
                              size: 20,
                              fontWeight: FontWeight.w700,
                              color: AppColor.primaryBlack,
                              onPressed: () {},
                              width: double.infinity,
                              height: 60,
                            ),

                            SizedboxHeight(h: 20),
                          ],
                        ),
                      ),
                      BackgroundImage(
                        height: 220,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextDefulte(
                                data: "Uses of wind energy in daily life",
                                size: 18,
                                fontWeight: FontWeight.w700,
                                color: AppColor.textColor,
                              ),
                              SizedboxHeight(h: 10),
                              LineBorder(width: 90, height: 4.8),
                              SizedboxHeight(h: 30),
                              TextDefulte(
                                data:
                                    "Generating electricity for homes and factories.Supporting electrical grids in remote areas.Operating water stations and desalination plants using wind energy systems.",
                                size: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColor.textColor,
                                maxLines: 5,
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedboxHeight(h: 20),
                      TextDefulte(
                        data: "How to Rationalize Wind Energy Consumption",
                        size: 24,
                        fontWeight: FontWeight.w700,
                        color: AppColor.textColor,
                      ),
                      SizedboxHeight(h: 15),
                      LineBorder(width: 100, height: 5),
                      SizedboxHeight(h: 15),

                      SizedboxHeight(h: 15),
                      TextDefulte(
                        data:
                            "Wind energy consumption optimization involves using techniques and methods aimed at improving the efficiency of wind energy utilization while reducing waste and minimizing environmental impact. This can be achieved through",
                        size: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColor.textColor,
                      ),
                      SizedboxHeight(h: 20),
                      ImprovingEnergyWidget(
                        title: "Storage and Control of Energy Production",
                        description:
                            "By using technologies like batteries or other storage systems, excess energy generated by turbines during strong wind periods can be stored and used later during periods of calm winds.",
                      ),

                      SizedboxHeight(h: 20),
                      ImprovingEnergyWidget(
                        title:
                            "Expanding Wind Energy Use in Suitable Locations",
                        description:
                            "Building wind farms in locations with strong and consistent winds, such as coastal areas or highlands, to maximize energy production.",
                      ),

                      SizedboxHeight(h: 20),
                      ImprovingEnergyWidget(
                        title: "Improving Wind Turbine Efficiency",
                        description:
                            "Developing and designing wind turbines that are more efficient in converting wind energy into electricity. Lightweight and durable materials can be used to reduce costs and increase productivity.",
                      ),
                      SizedboxHeight(h: 20),
                      SendMessage(),
                      SizedboxHeight(h: 20),
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
