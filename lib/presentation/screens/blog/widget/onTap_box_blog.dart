import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/utils/icons/app_icons.dart';
import 'package:power_pro_app/core/utils/images/app_images.dart';
import 'package:power_pro_app/core/widgets/container_color_widget.dart';
import 'package:power_pro_app/core/widgets/sizedbox_height.dart';
import 'package:power_pro_app/core/widgets/sizedbox_width.dart';
import 'package:power_pro_app/core/widgets/text_bottom_widget.dart';
import 'package:power_pro_app/core/widgets/text_defulte.dart';
import 'package:power_pro_app/presentation/screens/home/widget/send_message.dart';

class OntapBoxBlog extends StatefulWidget {
  final String title;
  final String name;
  final String time;
  final String imageCover;
  final String imageProfiel;

  const OntapBoxBlog({
    super.key,
    required this.title,
    required this.name,
    required this.time,
    required this.imageProfiel,
    required this.imageCover,
  });

  @override
  _OntapBoxBlogState createState() => _OntapBoxBlogState();
}

class _OntapBoxBlogState extends State<OntapBoxBlog> {
  bool _isLoading = true; // Loading state for fetching data

  @override
  void initState() {
    super.initState();
    // Simulate a delay to mimic fetching data
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isLoading = false; // Set loading state to false after data is fetched
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ContainerColorWidget(
        child: Scaffold(
          backgroundColor: const Color.fromARGB(0, 71, 66, 66),
          extendBody: true,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back Button
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context); // Go back to previous screen
                    },
                    icon: SvgPicture.asset(AppIcons.arrBack),
                  ),
                  SizedboxHeight(h: 15),

                  // Title of the Blog Post
                  _isLoading
                      ? Center(
                        child: CircularProgressIndicator(),
                      ) // Show loading indicator
                      : TextDefulte(
                        data: widget.title,
                        size: 24,
                        fontWeight: FontWeight.w700,
                        color: AppColor.textColor,
                      ),
                  SizedboxHeight(h: 15),

                  // Author and Time Section
                  _isLoading
                      ? SizedboxHeight(h: 10) // Give space if loading
                      : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  AppImages.splash, // Author profile image
                                  width: 30,
                                  height: 30,
                                ),
                              ),
                              SizedboxWidth(w: 8),
                              TextDefulte(
                                data: widget.name, // Author name
                                size: 18,
                                fontWeight: FontWeight.w600,
                                color: AppColor.textColor,
                              ),
                            ],
                          ),
                          TextDefulte(
                            data: widget.time, // Display time
                            size: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColor.blue,
                          ),
                        ],
                      ),
                  SizedboxHeight(h: 20),

                  // Cover Image of the Blog Post
                  _isLoading
                      ? Center(
                        child: CircularProgressIndicator(),
                      ) // Show loading for cover image
                      : Image.network(
                        widget.imageCover, // Blog cover image
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                  SizedboxHeight(h: 20),

                  // Blog Content Description
                  _isLoading
                      ? SizedboxHeight(h: 20) // Give space if loading
                      : TextDefulte(
                        data:
                            "Discover articles and tips on energy conservation in our blog. We help you adopt a sustainable lifestyle with innovative solutions and news on renewable energy.",
                        size: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColor.textColor,
                      ),
                  SizedboxHeight(h: 20),

                  // Avoid Stress (Subheading)
                  _isLoading
                      ? SizedboxHeight(h: 10) // Give space if loading
                      : TextDefulte(
                        data: "Avoid stress",
                        size: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColor.textColor,
                      ),
                  SizedboxHeight(h: 10),

                  // Long Blog Content
                  _isLoading
                      ? SizedboxHeight(h: 10) // Give space if loading
                      : TextDefulte(
                        data:
                            "Lorem ipsum dolor sit amet, consectetur. Quam urna varius dis vivamus pretium. Tellus feugiat eu commodo bibendum nulla id platea hac suspendisse. Vitae valibutior turpis semper dui altrices felis sit. Aut arco mitos penatibus...",
                        size: 12,
                        fontWeight: FontWeight.w700,
                        color: AppColor.textColor,
                      ),
                  SizedboxHeight(h: 15),

                  // Latest Blogs Section
                  _isLoading
                      ? SizedboxHeight(h: 15) // Give space if loading
                      : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextDefulte(
                            data: 'Latest blogs',
                            size: 20,
                            fontWeight: FontWeight.w600,
                            color: AppColor.textColor,
                          ),
                          TextBottomWidget(
                            onPressed: () {}, // Action for 'See More' button
                            data: 'See More',
                            size: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColor.blue,
                          ),
                        ],
                      ),
                  SizedboxHeight(h: 20),

                  // Blog Description
                  _isLoading
                      ? SizedboxHeight(h: 20) // Give space if loading
                      : TextDefulte(
                        data:
                            "Discover articles and tips on energy conservation in our blog. Stay updated and learn how to protect the environment.",
                        size: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColor.textColor,
                      ),
                  SizedboxHeight(h: 20),

                  // Horizontal ListView for Latest Blogs (Optional)
                  SizedboxHeight(h: 15),
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
