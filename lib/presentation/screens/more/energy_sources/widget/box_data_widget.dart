import 'package:flutter/material.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/widgets/text_defulte.dart';

class BoxDataWidget extends StatelessWidget {
  final String imageUrl;
  final Function()? onTap;
  final String name; // يمكنك تخصيص هذا العنوان كما هو مطلوب

  const BoxDataWidget({
    super.key,
    required this.imageUrl,
    this.onTap,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      width: 180, // تعيين عرض ثابت
      height: 290, // تعيين ارتفاع ثابت
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColor.blue,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 205, // تحديد عرض ثابت للصورة
                  height: 180, // تحديد ارتفاع ثابت للصورة
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover, // استخدام BoxFit.cover لملء المساحة
                      width: 180, // تحديد عرض ثابت للصورة
                      height: 180, // تحديد ارتفاع ثابت للصورة
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return Center(
                          child: CircularProgressIndicator(
                            value:
                                loadingProgress.expectedTotalBytes != null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        (loadingProgress.expectedTotalBytes ??
                                            1)
                                    : null,
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Center(
                          child: Icon(Icons.error, color: Colors.red),
                        );
                      },
                    ),
                  ),
                ),
              ),
              //    const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 5.0, top: 5),
                child: TextDefulte(
                  data: name,
                  size: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColor.primaryBlack,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
