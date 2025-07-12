import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:power_pro_app/core/models/blog_model.dart';
import 'package:power_pro_app/core/network/api/api_service.dart';
import 'package:power_pro_app/core/network/api/dio_consumer.dart';
import 'package:power_pro_app/core/network/cache/cache_helper.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/utils/images/app_images.dart';
import 'package:power_pro_app/core/widgets/bottom_text_widget.dart';
import 'package:power_pro_app/core/widgets/container_color_widget.dart';
import 'package:power_pro_app/core/widgets/line_border.dart';
import 'package:power_pro_app/core/widgets/sizedbox_height.dart';
import 'package:power_pro_app/core/widgets/text_bottom_widget.dart';
import 'package:power_pro_app/core/widgets/text_defulte.dart';
import 'package:power_pro_app/presentation/screens/blog/blog_screen.dart';
import 'package:power_pro_app/presentation/screens/blog/widget/data_blog.dart';
import 'package:power_pro_app/presentation/screens/home/widget/background_image.dart';
import 'package:power_pro_app/presentation/screens/home/widget/bottom_bar.dart';
import 'package:power_pro_app/presentation/screens/home/widget/box_energy_sources.dart';
import 'package:power_pro_app/presentation/screens/home/widget/box_our_videos.dart';
import 'package:power_pro_app/presentation/screens/home/widget/container_data.dart';
import 'package:power_pro_app/presentation/screens/home/widget/image_power__pro.dart';
import 'package:power_pro_app/presentation/screens/home/widget/send_message.dart';
import 'package:power_pro_app/presentation/screens/more/energy_saving_tips/energy_saving_tips_screen.dart';
import 'package:power_pro_app/presentation/screens/more/energy_sources/data/model.dart';
import 'package:power_pro_app/presentation/screens/more/energy_sources/energy_sources_screen.dart';
import 'package:power_pro_app/presentation/screens/more/energy_sources/ontap_energy_sources_screen.dart';
import 'package:power_pro_app/presentation/screens/more/energy_sources/widget/box_data_widget.dart';
import 'package:power_pro_app/presentation/screens/more/videos/data/model.dart';
import 'package:power_pro_app/presentation/screens/more/videos/videos_screen.dart';
import 'package:power_pro_app/presentation/screens/more/videos/widget/gridview_viedo_widget.dart';
import 'package:power_pro_app/presentation/screens/more/videos/widget/video_popup.dart';
import 'package:power_pro_app/service_locator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    _fetchVideos();
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

  bool isLoading = true;
  List<Video> videos = [];
  // Fetch videos from the API
  void _fetchVideos() async {
    try {
      final fetchedVideos = await _apiService.getVideoData();
      setState(() {
        videos = fetchedVideos;
        isLoading = false; // Hide loading spinner once data is fetched
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      // Handle error if needed
    }
  }

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
                    onPressed: () {
                      currentIndexNotifier.value = 3;
                    },
                    data: 'Contact Us',
                    size: 10,
                    fontWeight: FontWeight.w700,
                    color: AppColor.primaryWhite,
                    width: 100,
                  ),
                  SizedboxHeight(h: 20),
                  Image.asset(
                    AppImages.homePage,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
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
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const EnergySourcesScreen(),
                            ),
                          );
                        },
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
                  if (_isLoading)
                    Center(child: CircularProgressIndicator())
                  else
                    SizedBox(
                      height: 230,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5 + 1,
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) =>
                                              const EnergySavingTipsScreen(),
                                    ),
                                  );
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
                        onPressed: () {
                          currentIndexNotifier.value = 2;
                        },
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
                  FutureBuilder<List<Blog>>(
                    future: _apiService.getBlogData(), // API call to get blogs
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Center(child: Text('No blogs available.'));
                      }

                      final blogList = snapshot.data!;
                      return SizedBox(
                        height:
                            230, // Adjust the height as per your requirement
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount:
                              blogList.length > 5
                                  ? 6
                                  : blogList
                                      .length, // Limit to 5 items + 1 for the 'add' button
                          itemBuilder: (context, index) {
                            if (index == 5) {
                              // Adding the "Add" button at the end of the list
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.add_circle_outline,
                                    color: AppColor.blue,
                                    size: 40,
                                  ),
                                  onPressed: () {
                                    // Define action when the button is clicked
                                    currentIndexNotifier.value = 2;
                                  },
                                ),
                              );
                            } else {
                              final blog = blogList[index];
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                ),
                                child: DataBlog(
                                  id: blog.id ?? 'No ID',
                                  title: blog.title ?? 'No Title',
                                  author: blog.author ?? 'Unknown Author',
                                  date: blog.date ?? 'No Date',
                                  image:
                                      blog.image ??
                                      "https://res.cloudinary.com/dsrv7czbc/image/upload/v1751632138/an9nkz2b0jp54vkiekjp.jpg", // Default image
                                ),
                              );
                            }
                          },
                        ),
                      );
                    },
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
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const VideosScreen(),
                            ),
                          );
                        },
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
                  isLoading
                      ? Center(
                        child: CircularProgressIndicator(),
                      ) // Show loading indicator while fetching
                      : SizedBox(
                        height: 250, // Adjust height as per your requirement
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount:
                              videos.length > 5
                                  ? 6
                                  : videos
                                      .length, // Show 5 videos + 1 "Add" button
                          itemBuilder: (context, index) {
                            if (index == 5) {
                              // Show the "Add" button at the end of the list
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.add_circle_outline,
                                    color: AppColor.blue,
                                    size: 50,
                                  ),
                                  onPressed: () {
                                    // Action for "Add" button
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (context) => const VideosScreen(),
                                      ),
                                    );
                                  },
                                ),
                              );
                            } else {
                              final video = videos[index];
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                ),
                                child: GridViewViedoWidget(
                                  onPressed: () {
                                    _showVideoDialog(video.id!);
                                  },
                                  imagePath:
                                      video.thumbnailUrl ??
                                      "https://res.cloudinary.com/dsrv7czbc/image/upload/v1751768993/gasjucxnk1hafviwbtil.jpg", // Default image
                                  titleVideo: video.title ?? "No Title",
                                ),
                              );
                            }
                          },
                        ),
                      ),

                  SendMessage(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showVideoDialog(String videoId) async {
    final apiService = getIt<ApiService>();
    final video = await apiService.getVideoDetails(
      videoId, // Pass the video ID to fetch details
    ); // Fetch video details

    showDialog(
      context: context,
      builder:
          (context) => VideoPopupDialog(video: video), // Pass the Video object
    );
  }
}
