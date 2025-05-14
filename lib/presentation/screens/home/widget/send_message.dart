import 'package:flutter/material.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/widgets/bottom_text_widget.dart';
import 'package:power_pro_app/core/widgets/sizedbox_height.dart';
import 'package:power_pro_app/core/widgets/sizedbox_width.dart';
import 'package:power_pro_app/core/widgets/text_defulte.dart';
import 'package:power_pro_app/presentation/screens/home/widget/send_message_box.dart';

class SendMessage extends StatelessWidget {
  const SendMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColor.colorSendMessage,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextDefulte(
                        data: 'Name',
                        size: 10,
                        fontWeight: FontWeight.w700,
                        color: AppColor.white,
                      ),
                      SizedboxHeight(h: 5),
                      SendMessageBox(hint: 'Enter your name'),
                    ],
                  ),
                ),
                SizedboxWidth(w: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextDefulte(
                        data: 'Email',
                        size: 10,
                        fontWeight: FontWeight.w700,
                        color: AppColor.white,
                      ),
                      SizedboxHeight(h: 5),
                      SendMessageBox(hint: 'Enter your email'),
                    ],
                  ),
                ),
              ],
            ),
            SizedboxHeight(h: 20),
            TextDefulte(
              data: 'Company Name',
              size: 10,
              fontWeight: FontWeight.w700,
              color: AppColor.white,
            ),
            SizedboxHeight(h: 5),
            SendMessageBox(hint: 'Enter your company name'),
            SizedboxHeight(h: 20),
            TextDefulte(
              data: 'Message',
              size: 10,
              fontWeight: FontWeight.w700,
              color: AppColor.white,
            ),
            SizedboxHeight(h: 5),
            SendMessageBox(
              hint: 'Enter your message',
              height: 100,
              largText: true,
            ),
            SizedboxHeight(h: 20),
            BottomTextWidget(
              onPressed: () {},
              data: 'Send message',
              size: 10,
              fontWeight: FontWeight.w600,
              color: AppColor.primaryWhite,
              sizeBox: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
