import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/utils/icons/app_icons.dart';
import 'package:power_pro_app/core/widgets/container_color_widget.dart';
import 'package:power_pro_app/core/widgets/line_border.dart';
import 'package:power_pro_app/core/widgets/sizedbox_height.dart';
import 'package:power_pro_app/core/widgets/text_defulte.dart';
import 'package:power_pro_app/presentation/screens/home/widget/send_message.dart';
import 'package:power_pro_app/presentation/screens/more/energy_sources/widget/box_data_widget.dart';
import 'package:power_pro_app/presentation/screens/more/energy_sources/ontap_energy_sources_screen.dart';
import 'package:power_pro_app/core/network/api/dio_consumer.dart';
import 'package:power_pro_app/core/network/cache/cache_helper.dart';
import 'package:power_pro_app/core/network/api/api_service.dart';
import 'package:power_pro_app/presentation/screens/more/energy_sources/data/model.dart';

class EnergySourcesScreen extends StatefulWidget {
  const EnergySourcesScreen({Key? key}) : super(key: key);

  @override
  _EnergySourcesScreenState createState() => _EnergySourcesScreenState();
}

class _EnergySourcesScreenState extends State<EnergySourcesScreen> {
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
    return SafeArea(
      child: ContainerColorWidget(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          extendBody: true,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back button
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
                  // Title
                  TextDefulte(
                    data: "Energy Sources",
                    size: 24,
                    fontWeight: FontWeight.w700,
                    color: AppColor.textColor,
                  ),
                  SizedboxHeight(h: 20),
                  LineBorder(width: 100, height: 5),
                  SizedboxHeight(h: 20),
                  // Description
                  TextDefulte(
                    data:
                        "Energy sources are the beating heart of our daily lives, playing a crucial role in powering our homes, businesses, and developing our communities.",
                    size: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColor.textColor,
                  ),
                  SizedboxHeight(h: 20),
                  // Loading state
                  if (_isLoading)
                    Center(child: CircularProgressIndicator())
                  else
                  // Error state
                  if (_errorMessage.isNotEmpty)
                    Center(child: Text(_errorMessage))
                  else
                    // Data available
                    GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 0.75,
                          ),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _energySources.length,
                      itemBuilder: (context, index) {
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
                                          energySource.howItWorksDescription,
                                      howItWorksImage:
                                          energySource.howItWorksImage,
                                    ),
                              ),
                            );
                          },
                        );
                      },
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
