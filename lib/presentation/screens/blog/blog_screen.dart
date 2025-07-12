import 'package:flutter/material.dart';
import 'package:power_pro_app/core/di/dependency_injection.dart';
import 'package:power_pro_app/core/models/blog_model.dart';
import 'package:power_pro_app/core/network/api/api_service.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/widgets/container_color_widget.dart';
import 'package:power_pro_app/core/widgets/line_border.dart';
import 'package:power_pro_app/core/widgets/sizedbox_height.dart';
import 'package:power_pro_app/core/widgets/text_defulte.dart';
import 'package:power_pro_app/presentation/screens/blog/widget/data_blog.dart';
import 'package:power_pro_app/presentation/screens/home/widget/send_message.dart';

class BlogScreen extends StatelessWidget {
  final ApiService _apiService = getIt<ApiService>();

  BlogScreen({super.key});

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
                    data: "Our Blog",
                    size: 24,
                    fontWeight: FontWeight.w700,
                    color: AppColor.textColor,
                  ),
                  SizedboxHeight(h: 20),
                  LineBorder(width: 100, height: 5),
                  SizedboxHeight(h: 20),
                  TextDefulte(
                    data:
                        "Discover articles and tips on energy conservation in our blog. We help you adopt a sustainable lifestyle with innovative solutions and news on renewable energy. Stay updated and learn how to protect the environment and reduce energy use.",
                    size: 12,
                    fontWeight: FontWeight.w500,
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
                      return GridView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: blogList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 220,
                        ),
                        itemBuilder: (context, index) {
                          final blog = blogList[index];
                          return DataBlog(
                            id: blog.id ?? 'No ID',
                            title: blog.title ?? 'No Title',
                            author: 'Patricia Anderson',
                            date:  'Apr 27th, 2022',
                            image:
                                blog.image ??
                                "https://res.cloudinary.com/dsrv7czbc/image/upload/v1751632138/an9nkz2b0jp54vkiekjp.jpg", // Default image
                          );
                        },
                      );
                    },
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
}
