import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/utils/icons/app_icons.dart';
import 'package:power_pro_app/core/utils/images/app_images.dart';
import 'package:power_pro_app/core/widgets/container_color_widget.dart';
import 'package:power_pro_app/core/widgets/sizedbox_height.dart';
import 'package:power_pro_app/core/widgets/sizedbox_width.dart';
import 'package:power_pro_app/core/widgets/text_bottom_widget.dart';
import 'package:power_pro_app/core/widgets/text_defulte.dart';
import 'package:power_pro_app/presentation/screens/blog/widget/data_blog.dart';
import 'package:power_pro_app/presentation/screens/home/widget/bottom_bar.dart';
import 'package:power_pro_app/presentation/screens/home/widget/send_message.dart';

class OntapBoxBlog extends StatelessWidget {
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
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: SvgPicture.asset(AppIcons.arrBack),
                  ),
                  SizedboxHeight(h: 15),
                  TextDefulte(
                    data: title,
                    size: 24,
                    fontWeight: FontWeight.w700,
                    color: AppColor.textColor,
                  ),
                  SizedboxHeight(h: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              imageProfiel,
                              width: 30,
                              height: 30,
                            ),
                          ),
                          SizedboxWidth(w: 8),
                          TextDefulte(
                            data: name,
                            size: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColor.textColor,
                          ),
                        ],
                      ),
                      TextDefulte(
                        data: time,
                        size: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColor.blue,
                      ),
                    ],
                  ),
                  SizedboxHeight(h: 20),
                  Image.asset(
                    imageCover,
                    width: double.infinity,
                    fit: BoxFit.cover,
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
                  TextDefulte(
                    data: "Avoid stress",
                    size: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColor.textColor,
                  ),
                  SizedboxHeight(h: 10),
                  TextDefulte(
                    data:
                        "Lorem ipsum dolor sit amet, consectetur. Quam urna varius dis vivamus pretium. Tellus feugiat eu commodo bibendum nulla id platea hac suspendisse. Vitae valibutior turpis semper dui altrices felis sit. Aut arco mitos penatibus. Lorem ipsum dolor sit amet, consectetur. Quam urna varius dis vivamus pretium. Tellus feugiat eu commodo bibendum nulla id platea hac suspendisse. Vitae valibutior turpis semper dui altrices felis sit. Aut arco mitos penatibus. Lorem ipsum dolor sit amet, consectetur. Quam urna varius dis vivamus pretium. Tellus feugiat eu commodo bibendum nulla id platea hac suspendisse. Vitae valibutior turpis semper dui altrices felis sit. Aut arco mitos penatibus.",
                    size: 12,
                    fontWeight: FontWeight.w700,
                    color: AppColor.textColor,
                  ),
                  SizedboxHeight(h: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextDefulte(
                        data: 'Lastest blogs',
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
                  TextDefulte(
                    data:
                        "Discover articles and tips on energy conservation in our blog. We help you adopt a sustainable lifestyle with innovative solutions and news on renewable energy. Stay updated and learn how to protect the environment and reduce energy use.",
                    size: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColor.textColor,
                  ),
                  SizedboxHeight(h: 20),
                  SizedBox(
                    height: 220,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder:
                          (context, index) => DataBlog(
                            title: title,
                            name: name,
                            time: time,
                            imageProfiel: imageProfiel,
                            imageCover: imageCover,
                          ),
                      itemCount: 5,
                    ),
                  ),
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
