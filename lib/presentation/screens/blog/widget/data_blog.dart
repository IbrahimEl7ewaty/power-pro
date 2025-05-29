import 'package:flutter/material.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/widgets/sizedbox_height.dart';
import 'package:power_pro_app/core/widgets/sizedbox_width.dart';
import 'package:power_pro_app/core/widgets/text_defulte.dart';
import 'package:power_pro_app/presentation/screens/blog/widget/onTap_box_blog.dart';

class DataBlog extends StatelessWidget {
  final String title;
  final String name;
  final String time;
  final String imageProfiel;
  final String imageCover;
  const DataBlog({
    super.key,
    required this.title,
    required this.name,
    required this.time,
    required this.imageProfiel,
    required this.imageCover,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => OntapBoxBlog(
                  title: title,
                  name: name.toString(),
                  time: time,
                  imageProfiel: imageProfiel,
                  imageCover: imageCover,
                ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(5),
        width: 170,
        height: 190,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColor.primaryWhite,
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    imageCover,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              SizedboxHeight(h: 10),
              TextDefulte(
                data: title,
                size: 10,
                fontWeight: FontWeight.w700,
                color: AppColor.textColor,
                maxLines: 2,
              ),
              SizedboxHeight(h: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(imageProfiel, width: 22, height: 22),
                      ),
                      SizedboxWidth(w: 3),
                      TextDefulte(
                        data: name,
                        size: 7,
                        fontWeight: FontWeight.w700,
                        color: AppColor.textColor,
                      ),
                    ],
                  ),
                  TextDefulte(
                    data: time,
                    size: 7,
                    fontWeight: FontWeight.w700,
                    color: AppColor.blue,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
