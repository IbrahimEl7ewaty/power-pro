import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/utils/icons/app_icons.dart';
import 'package:power_pro_app/core/utils/images/app_images.dart';
import 'package:power_pro_app/core/widgets/container_color_widget.dart';
import 'package:power_pro_app/core/widgets/line_border.dart';
import 'package:power_pro_app/core/widgets/sizedbox_height.dart';
import 'package:power_pro_app/core/widgets/text_defulte.dart';
import 'package:power_pro_app/presentation/screens/home/widget/box_energy_sources.dart';
import 'package:power_pro_app/presentation/screens/home/widget/send_message.dart';
import 'package:power_pro_app/presentation/screens/more/energy_saving_tips/widget/container_image.dart';
import 'package:power_pro_app/presentation/screens/more/energy_sources/ontap_energy_sources_screen.dart';
import 'package:power_pro_app/presentation/screens/more/energy_sources/widget/box_data_widget.dart';

class EnergySourcesScreen extends StatelessWidget {
 
  const EnergySourcesScreen({super.key, });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ContainerColorWidget(
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

                      GridView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 8,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          mainAxisExtent: 300,
                        ),
                        itemBuilder: (context, index) {
                          return BoxDataWidget(
                            imageUrl: AppImages.energySources1,
                           
                            
                          );
                        },
                      ),
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
