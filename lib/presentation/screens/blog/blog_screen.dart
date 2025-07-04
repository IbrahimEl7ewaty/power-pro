import 'package:flutter/material.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/utils/images/app_images.dart';
import 'package:power_pro_app/core/widgets/container_color_widget.dart';
import 'package:power_pro_app/core/widgets/line_border.dart';
import 'package:power_pro_app/core/widgets/sizedbox_height.dart';
import 'package:power_pro_app/core/widgets/text_defulte.dart';
import 'package:power_pro_app/presentation/screens/blog/widget/data_blog.dart';
import 'package:power_pro_app/presentation/screens/home/widget/send_message.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

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
                  GridView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,

                      mainAxisExtent: 200,
                    ),
                    itemBuilder: (context, index) {
                      return DataBlog(
                        title: "10 Simple Tips to Save Energy at Home",
                        name: "Patricia Anderson",
                        time: "Apr 27th, 2022",
                        imageProfiel: AppImages.splash,
                        imageCover: AppImages.powerProImage,
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
