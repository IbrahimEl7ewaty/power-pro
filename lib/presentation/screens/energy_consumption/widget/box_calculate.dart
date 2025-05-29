import 'package:flutter/material.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/widgets/bottom_text_widget.dart';
import 'package:power_pro_app/core/widgets/sizedbox_height.dart';
import 'package:power_pro_app/core/widgets/text_defulte.dart';
import 'package:power_pro_app/presentation/screens/home/widget/send_message_box.dart';

class BoxCalculate extends StatelessWidget {
  const BoxCalculate({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        color: AppColor.colorSendMessage,
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextDefulte(
              data: "Number of devices?",
              size: 11,
              fontWeight: FontWeight.w500,
              color: AppColor.textColorWhite,
            ),
            SizedboxHeight(h: 5),
            SendMessageBox(height: 35),
            SizedboxHeight(h: 10),
            TextDefulte(
              data: "How many hours of operation per day?",
              size: 11,
              fontWeight: FontWeight.w500,
              color: AppColor.textColorWhite,
            ),
            SizedboxHeight(h: 5),
            SendMessageBox(height: 35),
            SizedboxHeight(h: 20),
            BottomTextWidget(
              onPressed: () {},
              data: "Calculate your consumption",
              size: 10,
              fontWeight: FontWeight.w600,
              color: AppColor.primaryBlack,
              width: double.infinity,
            ),
            SizedboxHeight(h: 15),
          ],
        ),
      ),
    );
  }
}
