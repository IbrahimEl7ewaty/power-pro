import 'package:flutter/material.dart';
import 'package:power_pro_app/core/utils/color/app_color.dart';
import 'package:power_pro_app/core/widgets/text_defulte.dart';
import 'package:slide_countdown/slide_countdown.dart';

class ResendCountdown extends StatefulWidget {
  final VoidCallback onResend;

  const ResendCountdown({super.key, required this.onResend});

  @override
  State<ResendCountdown> createState() => _ResendCountdownState();
}

class _ResendCountdownState extends State<ResendCountdown> {
  bool isCountdownFinished = false;
  final Duration countdownDuration = Duration(seconds: 10);

  void _restartCountdown() {
    widget.onResend(); // استدعاء الدالة الحقيقية
    setState(() {
      isCountdownFinished = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isCountdownFinished
        ? TextButton(
          onPressed: _restartCountdown,
          child: TextDefulte(
            data: 'Resend Code',
            size: 18,
            fontWeight: FontWeight.w700,
            color: AppColor.blue,
          ),
        )
        // ElevatedButton(
        //     onPressed: _restartCountdown,
        //     style: ElevatedButton.styleFrom(
        //       backgroundColor: Colors.blue,
        //       foregroundColor: Colors.white,
        //     ),
        //     child: const Text('Resend Code'),
        //   )
        : SlideCountdownSeparated(
          duration: countdownDuration,
          separatorType: SeparatorType.symbol,
          slideDirection: SlideDirection.down,
          decoration: BoxDecoration(color: Colors.transparent),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColor.blue,
          ),
          onDone: () {
            setState(() {
              isCountdownFinished = true;
            });
          },
        );
  }
}
