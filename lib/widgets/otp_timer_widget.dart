import 'dart:async';
import 'package:flutter/material.dart';
import 'package:marketi_ecommers/constant/colors.dart';

class OtpTimer extends StatefulWidget {
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
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
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
        SizedBox(height: 10),
        GestureDetector(
          onTap: _canResend
              ? () {
                  print("Resend Code Clicked");
                  startTimer(); 
                }
              : null,
          child: Text(
            "Resend Code",
            style: TextStyle(
              color: _canResend ? PrimaryColor : Color(0xff51526C),
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
