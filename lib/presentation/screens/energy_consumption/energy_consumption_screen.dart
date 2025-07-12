import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:power_pro_app/core/network/api/api_service.dart';
import 'package:power_pro_app/core/network/api/dio_consumer.dart';
import 'package:power_pro_app/core/network/cache/cache_helper.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/utils/images/app_images.dart';
import 'package:power_pro_app/core/utils/videos/app_videos.dart';
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
import 'package:power_pro_app/presentation/screens/more/energy_saving_tips/widget/video_player_widget.dart';
import 'package:power_pro_app/presentation/screens/more/energy_sources/data/model.dart';
import 'package:power_pro_app/presentation/screens/more/energy_sources/energy_sources_screen.dart';
import 'package:power_pro_app/presentation/screens/more/energy_sources/ontap_energy_sources_screen.dart';
import 'package:power_pro_app/presentation/screens/more/energy_sources/widget/box_data_widget.dart';

class EnergyConsumptionScreen extends StatefulWidget {
  const EnergyConsumptionScreen({super.key});

  @override
  State<EnergyConsumptionScreen> createState() =>
      _EnergyConsumptionScreenState();
}

class _EnergyConsumptionScreenState extends State<EnergyConsumptionScreen> {
  bool _isLoading = true;
  List<EnergySource> _energySources = [];
  String _errorMessage = '';

  final ApiService _apiService = ApiService(
    apiConsumer: DioConsumer(dio: Dio()),
    cacheHelper: CacheHelper(),
  );

  @override
  void initState() {
    super.initState();
    _fetchEnergySources();
  }

  Future<void> _fetchEnergySources() async {
    try {
      final response = await _apiService.getEnergySourcesData();
      setState(() {
        _energySources = response;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = "Error: $e";
        _isLoading = false;
      });
    }
  }

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
                  VideoPlayerWidget(
                    videoPath: 'assets/videos/energy_saving_tips.mp4',
                  ),
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
                  if (_isLoading)
                    Center(child: CircularProgressIndicator())
                  else
                    SizedBox(
                      height: 230,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5 + 1, // إضافة 1 لزر "عرض المزيد"
                        itemBuilder: (context, index) {
                          if (index == 5) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => EnergySourcesScreen(),
                                    ),
                                  );
                                },
                                child: Icon(
                                  Icons.add_circle_outline,
                                  color: AppColor.blue,
                                  size: 40,
                                ),
                              ),
                            );
                          } else {
                            final energySource = _energySources[index];
                            return BoxDataWidget(
                              imageUrl: energySource.coverImage,
                              name: energySource.name,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => OntapEnergySourcesScreen(
                                          imageUrl: energySource.coverImage,
                                          name: energySource.name,
                                          description: energySource.description,
                                          advantages: energySource.advantages,
                                          dailyUses: energySource.dailyUses,
                                          howItWorksDescription:
                                              energySource
                                                  .howItWorksDescription,
                                          howItWorksImage:
                                              energySource.howItWorksImage,
                                        ),
                                  ),
                                );
                              },
                            );
                          }
                        },
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
