import 'package:flutter/material.dart';
import 'package:power_pro_app/core/models/blog_model.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/utils/images/app_images.dart';
import 'package:power_pro_app/core/widgets/sizedbox_height.dart';
import 'package:power_pro_app/core/widgets/sizedbox_width.dart';
import 'package:power_pro_app/core/widgets/text_defulte.dart';
import 'package:power_pro_app/presentation/screens/blog/widget/onTap_box_blog.dart';

class DataBlog extends StatelessWidget {
  final String id;
  final String title;
  final String author;
  final String date;
  final String image;

  const DataBlog({
    super.key,
    required this.id,
    required this.title,
    required this.author,
    required this.date,
    required this.image,
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
                  name: author,
                  time: date,
                  imageProfiel: image, // تخصيص صورة الكاتب هنا
                  imageCover: image, // استعراض صورة المقال
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
                  child: Image.network(
                    image, // عرض الصورة باستخدام URL
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 120, // تحديد ارتفاع الصورة
                  ),
                ),
              ),
              SizedboxHeight(h: 10),
              TextDefulte(
                data: title, // عنوان المقال
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
                        child: Image.asset(
                          AppImages.splash,
                          width: 22,
                          height: 22,
                        ),
                      ),
                      SizedboxWidth(w: 3),
                      TextDefulte(
                        data: author, // اسم الكاتب
                        size: 7,
                        fontWeight: FontWeight.w700,
                        color: AppColor.textColor,
                      ),
                    ],
                  ),
                  TextDefulte(
                    data: date,
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
