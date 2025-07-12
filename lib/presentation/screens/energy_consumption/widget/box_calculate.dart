import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/widgets/sizedbox_height.dart';
import 'package:power_pro_app/core/widgets/text_defulte.dart';
import 'package:power_pro_app/core/widgets/bottom_text_widget.dart';
import 'package:power_pro_app/presentation/screens/energy_consumption/widget/CalculateButton.dart';
import 'package:power_pro_app/presentation/screens/energy_consumption/widget/custoom_form.dart';

class BoxCalculate extends StatefulWidget {
  const BoxCalculate({super.key});

  @override
  _BoxCalculateState createState() => _BoxCalculateState();
}

class _BoxCalculateState extends State<BoxCalculate> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for all inputs
  final TextEditingController _datetimeController = TextEditingController();
  final TextEditingController _temperatureController = TextEditingController();
  final TextEditingController _humidityController = TextEditingController();
  final TextEditingController _windspeedController = TextEditingController();
  final TextEditingController _generalDiffuseFlowsController =
      TextEditingController();

  bool _isLoading = false;
  String _responseMessage = '';
  double _powerConsumptionZone1 = 0.0;
  double _powerConsumptionZone2 = 0.0;
  double _powerConsumptionZone3 = 0.0;

  // Send data to the API and get the response
  Future<void> _calculateConsumption() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
      _responseMessage = '';
    });

    try {
      final response = await Dio().post(
        'https://saleh2003.pythonanywhere.com/predict',
        data: {
          "Datetime": _datetimeController.text, // Datetime input
          "Temperature": double.parse(_temperatureController.text),
          "Humidity": double.parse(_humidityController.text),
          "WindSpeed": double.parse(_windspeedController.text),
          "GeneralDiffuseFlows": double.parse(
            _generalDiffuseFlowsController.text,
          ),
        },
      );

      setState(() {
        _isLoading = false;
        _responseMessage = response.data['message']; // Success message from API
        _powerConsumptionZone1 = response.data['PowerConsumption_Zone1'];
        _powerConsumptionZone2 = response.data['PowerConsumption_Zone2'];
        _powerConsumptionZone3 = response.data['PowerConsumption_Zone3'];
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _responseMessage = 'Failed to get data';
      });
    }
  }

  @override
  void dispose() {
    _datetimeController.dispose();
    _temperatureController.dispose();
    _humidityController.dispose();
    _windspeedController.dispose();
    _generalDiffuseFlowsController.dispose();
    super.dispose();
  }

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
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // DateTime Input
              TextDefulte(
                data: "Enter Datetime (yyyy-mm-dd hh:mm:ss)",
                size: 11,
                fontWeight: FontWeight.w500,
                color: AppColor.textColorWhite,
              ),
              SizedboxHeight(h: 5),
              CustomForm(
                height: 35,
                controller: _datetimeController,
                hint: 'Enter Datetime',
                largText: false,
              ),
              SizedboxHeight(h: 10),

              // Temperature Input
              TextDefulte(
                data: "Enter Temperature (°C)",
                size: 11,
                fontWeight: FontWeight.w500,
                color: AppColor.textColorWhite,
              ),
              SizedboxHeight(h: 5),
              CustomForm(
                height: 35,
                controller: _temperatureController,
                hint: 'Enter Temperature',
                largText: false,
              ),
              SizedboxHeight(h: 10),

              // Humidity Input
              TextDefulte(
                data: "Enter Humidity (%)",
                size: 11,
                fontWeight: FontWeight.w500,
                color: AppColor.textColorWhite,
              ),
              SizedboxHeight(h: 5),
              CustomForm(
                height: 35,
                controller: _humidityController,
                hint: 'Enter Humidity',
                largText: false,
              ),
              SizedboxHeight(h: 10),

              // WindSpeed Input
              TextDefulte(
                data: "Enter Wind Speed (m/s)",
                size: 11,
                fontWeight: FontWeight.w500,
                color: AppColor.textColorWhite,
              ),
              SizedboxHeight(h: 5),
              CustomForm(
                height: 35,
                controller: _windspeedController,
                hint: 'Enter Wind Speed',
                largText: false,
              ),
              SizedboxHeight(h: 10),

              // GeneralDiffuseFlows Input
              TextDefulte(
                data: "Enter General Diffuse Flows",
                size: 11,
                fontWeight: FontWeight.w500,
                color: AppColor.textColorWhite,
              ),
              SizedboxHeight(h: 5),
              CustomForm(
                height: 35,
                controller: _generalDiffuseFlowsController,
                hint: 'Enter General Diffuse Flows',
                largText: false,
              ),
              SizedboxHeight(h: 20),

              // Calculate Button
              CalculateButton(
                isLoading: _isLoading,
                onPressed:
                    _calculateConsumption, // دالة الحساب أو إرسال البيانات إلى السيرفر
              ),

              SizedboxHeight(h: 15),

              // Display the response message
              if (_responseMessage.isNotEmpty)
                TextDefulte(
                  data: _responseMessage,
                  size: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColor.textColorWhite,
                ),
              SizedboxHeight(h: 10),

              // Display the results if successful
              if (_responseMessage == 'Success')
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColor.primaryWhite,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextDefulte(
                        data:
                            "Power Consumption in Zone 1: $_powerConsumptionZone1 kWh",
                        size: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColor.textColor,
                      ),
                      SizedboxHeight(h: 10),
                      TextDefulte(
                        data:
                            "Power Consumption in Zone 2: $_powerConsumptionZone2 kWh",
                        size: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColor.textColor,
                      ),
                      SizedboxHeight(h: 10),
                      TextDefulte(
                        data:
                            "Power Consumption in Zone 3: $_powerConsumptionZone3 kWh",
                        size: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColor.textColor,
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
