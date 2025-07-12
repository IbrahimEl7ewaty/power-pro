import 'package:flutter/material.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/utils/images/app_images.dart';
import 'package:power_pro_app/core/widgets/box_learn_more.dart';
import 'package:power_pro_app/core/widgets/sizedbox_height.dart';
import 'package:power_pro_app/core/widgets/text_defulte.dart';
import 'package:power_pro_app/presentation/screens/more/energy_saving_tips/widget/container_image_ofline.dart';

class ImprovingWidget extends StatelessWidget {
  final bool isLearningMore;
  final Function()? onPressed;
  final bool? isShowMore;
  const ImprovingWidget({
    super.key,
    this.isLearningMore = true,
    this.onPressed,
    this.isShowMore = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity, // Change to expand fully based on content
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: AppColor.primaryWhite,
      ),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextDefulte(
              data: 'Improving thermal insulation',
              size: 18,
              fontWeight: FontWeight.w900,
              color: AppColor.textColor,
            ),
            SizedboxHeight(h: 20),

            // Conditional display for the description text
            isShowMore == true
                ? TextDefulte(
                  data:
                      "Improving thermal insulation in your home can significantly reduce energy consumption and lower heating and cooling costs. By sealing gaps, adding insulation to walls and attics, and using energy-efficient windows, you can create a more comfortable living environment while minimizing the need for excessive heating or cooling.",
                  size: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColor.textColorHint,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                )
                : TextDefulte(
                  data:
                      "Improving thermal insulation in your home can significantly reduce energy consumption and lower heating and cooling costs. By sealing gaps, adding insulation to walls and attics, and using energy-efficient windows, you can create a more comfortable living environment while minimizing the need for excessive heating or cooling.",
                  size: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColor.textColorHint,
                ),

            SizedboxHeight(h: 20),

            // Display the "Learn More" button if isLearningMore is true
            if (isLearningMore)
              BoxLearnMore(height: 27, width: 70, onPressed: onPressed),

            SizedboxHeight(h: 20),

            // Image container
            ContainerImageOfline(image: AppImages.energySaving2),

            SizedboxHeight(h: 10),
          ],
        ),
      ),
    );
  }
}
