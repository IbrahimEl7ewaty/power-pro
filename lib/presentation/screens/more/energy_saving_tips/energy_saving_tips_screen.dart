import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:power_pro_app/core/network/api/dio_consumer.dart';
import 'package:power_pro_app/core/network/cache/cache_helper.dart';
import 'package:power_pro_app/core/network/api/api_service.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/utils/icons/app_icons.dart';
import 'package:power_pro_app/core/widgets/container_color_widget.dart';
import 'package:power_pro_app/core/widgets/sizedbox_height.dart';
import 'package:power_pro_app/core/widgets/text_defulte.dart';
import 'package:power_pro_app/presentation/screens/more/energy_saving_tips/data/model.dart';
import 'package:power_pro_app/presentation/screens/more/energy_saving_tips/widget/container_image.dart';
import 'package:power_pro_app/presentation/screens/more/energy_saving_tips/improving_screen.dart';
import 'package:power_pro_app/core/widgets/line_border.dart';
import 'package:power_pro_app/presentation/screens/home/widget/send_message.dart';
import 'package:power_pro_app/presentation/screens/more/energy_saving_tips/widget/improving_widget.dart';
import 'package:power_pro_app/presentation/screens/more/energy_saving_tips/widget/video_player_widget.dart';

class EnergySavingTipsScreen extends StatefulWidget {
  const EnergySavingTipsScreen({super.key});

  @override
  _EnergySavingTipsScreenState createState() => _EnergySavingTipsScreenState();
}

class _EnergySavingTipsScreenState extends State<EnergySavingTipsScreen> {
  bool _isLoading = true;
  List<EnergyTips> _energyTips = [];
  String _errorMessage = '';

  final ApiService _apiService = ApiService(
    apiConsumer: DioConsumer(dio: Dio()),
    cacheHelper: CacheHelper(),
  );

  @override
  void initState() {
    super.initState();
    _fetchEnergyTips(); // جلب البيانات من الـ API في الخلفية
  }

  // جلب بيانات الـ API في الخلفية
  Future<void> _fetchEnergyTips() async {
    try {
      final response =
          await _apiService.getEnergyTipsData(); // جلب نصائح الطاقة

      // طباعة البيانات المستلمة للتحقق منها
      print("Response Data: $response");

      setState(() {
        _energyTips = response;
        _isLoading = false;
      });
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        setState(() {
          _errorMessage = "The resource you're looking for is not available.";
        });
      } else {
        setState(() {
          _errorMessage = "An error occurred: ${e.message}";
        });
      }
      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = "An unexpected error occurred: $e";
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
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // زر الرجوع
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context); // العودة إلى الشاشة السابقة
                        },
                        icon: SvgPicture.asset(AppIcons.arrBack),
                      ),
                    ],
                  ),
                  SizedboxHeight(h: 20),
                  // العنوان
                  TextDefulte(
                    data: 'Energy Saving Tips',
                    size: 24,
                    fontWeight: FontWeight.w700,
                    color: AppColor.textColor,
                  ),
                  SizedboxHeight(h: 20),
                  LineBorder(width: 100, height: 5),
                  SizedboxHeight(h: 20),
                  // وصف العنوان
                  TextDefulte(
                    data:
                        "Discover practical and easy-to-implement energy-saving tips that can make a big difference.",
                    size: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColor.textColorHint,
                  ),
                  SizedboxHeight(h: 20),

                  // استدعاء VideoPlayerWidget هنا
                  VideoPlayerWidget(
                    videoPath: 'assets/videos/energy_saving_tips.mp4',
                  ),

                  SizedboxHeight(h: 20),
                  //    ImprovingWidget(isLearningMore: false, isShowMore: false),
                  // عرض نصائح الطاقة (API) إذا كانت موجودة
                  if (_isLoading)
                    Center(child: CircularProgressIndicator())
                  else if (_errorMessage.isNotEmpty)
                    Center(child: Text(_errorMessage))
                  else
                    GridView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _energyTips.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        mainAxisExtent: 200,
                      ),
                      itemBuilder: (context, index) {
                        final energyTip = _energyTips[index];
                        return ContainerImage(
                          image: energyTip.image,
                          title: energyTip.name,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ImprovingScreen(),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  SizedboxHeight(h: 20),
                  SendMessage(), // دالة إرسال الرسالة كما كانت
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
