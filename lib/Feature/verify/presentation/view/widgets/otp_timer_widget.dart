import 'dart:async';
import 'package:flutter/material.dart';
import 'package:marketi_ecommers/core/utils/colors.dart';

import '../../../../../core/widgets/core/custom_text__widget.dart';

class OtpTimer extends StatefulWidget {
  const OtpTimer({super.key});

  @override
  _OtpTimerState createState() => _OtpTimerState();
}

class _OtpTimerState extends State<OtpTimer> {
  int _start = 60;
  Timer? _timer;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _canResend = false;
    _start = 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          _canResend = true;
          _timer?.cancel();
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          _canResend ? "00:00" : "00:${_start.toString().padLeft(2, '0')}",
          style: TextStyle(fontSize: 18, color: Colors.grey[700]),
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: _canResend
              ? () {
                  print("Resend Code Clicked");
                  startTimer();
                }
              : null,
          child: CustomTextWidget(
            text: 'Resend Code',
            color: _canResend ? PrimaryColor : const Color(0xff51526C),
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
