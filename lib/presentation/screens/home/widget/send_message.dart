import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:power_pro_app/core/network/api/api_service.dart';
import 'package:power_pro_app/core/network/api/dio_consumer.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/widgets/bottom_text_widget.dart';
import 'package:power_pro_app/core/widgets/sizedbox_height.dart';
import 'package:power_pro_app/core/widgets/sizedbox_width.dart';
import 'package:power_pro_app/core/widgets/text_defulte.dart';
import 'package:power_pro_app/presentation/screens/home/widget/send_message_box.dart';
import 'package:power_pro_app/core/network/api/api_consumer.dart';
import 'package:power_pro_app/core/network/cache/cache_helper.dart'; // Import CacheHelper

class SendMessage extends StatefulWidget {
  final double? height;
  const SendMessage({super.key, this.height});

  @override
  _SendMessageState createState() => _SendMessageState();
}

class _SendMessageState extends State<SendMessage> {
  String statusMessage = '';
  bool isSuccess = false;
  bool isLoading = false; // Flag for loading state

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  // Initialize CacheHelper
  final CacheHelper cacheHelper = CacheHelper();

  // Initialize ApiService with both apiConsumer and cacheHelper
  final ApiService apiService = ApiService(
    apiConsumer: DioConsumer(dio: Dio()), // Use the concrete implementation
    cacheHelper: CacheHelper(),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextDefulte(
          data: 'Get in touch',
          size: 16,
          fontWeight: FontWeight.w700,
          color: AppColor.blue,
        ),
        SizedboxHeight(h: 10),
        TextDefulte(
          data: 'Reach out to us for any help and inquiries',
          size: 20,
          fontWeight: FontWeight.w700,
          color: AppColor.textColor,
        ),
        SizedboxHeight(h: 20),
        TextDefulte(
          data: 'Our friendly team would love to hear from you.',
          size: 12,
          fontWeight: FontWeight.w700,
          color: AppColor.textColor,
        ),
        SizedboxHeight(h: 20),
        Container(
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
                          SendMessageBox(
                            hint: 'Enter your name',
                            controller: nameController,
                          ),
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
                          SendMessageBox(
                            hint: 'Enter your email',
                            controller: emailController,
                          ),
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
                SendMessageBox(
                  hint: 'Enter your company name',
                  controller: companyController,
                ),
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
                  controller: messageController,
                ),
                SizedboxHeight(h: 20),
                // Show the loading indicator if isLoading is true
                isLoading
                    ? Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColor.blue,
                        ),
                      ),
                    )
                    : BottomTextWidget(
                      onPressed: () async {
                        setState(() {
                          isLoading = true; // Start loading
                        });

                        try {
                          final response = await apiService.sendContactMessage(
                            nameController.text,
                            messageController.text,
                          );

                          setState(() {
                            if (response['status'] == 'success') {
                              statusMessage =
                                  response['message'] ??
                                  'Message sent successfully!';
                              isSuccess = true;
                            } else {
                              statusMessage = 'Failed to send message.';
                              isSuccess = false;
                            }

                            // Clear the form fields after the message is sent
                            nameController.clear();
                            emailController.clear();
                            companyController.clear();
                            messageController.clear();

                            isLoading = false; // Stop loading after response
                          });
                        } catch (e) {
                          setState(() {
                            statusMessage = 'Error sending message: $e';
                            isSuccess = false;
                            isLoading = false; // Stop loading on error
                          });
                        }
                      },
                      data: 'Send message',
                      size: 10,
                      fontWeight: FontWeight.w600,
                      color: AppColor.primaryWhite,
                      width: double.infinity,
                    ),
                if (statusMessage.isNotEmpty) ...[
                  SizedboxHeight(h: 20),
                  Text(
                    statusMessage,
                    style: TextStyle(
                      color: isSuccess ? Colors.green : Colors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
        SizedboxHeight(h: widget.height ?? 0),
      ],
    );
  }
}
