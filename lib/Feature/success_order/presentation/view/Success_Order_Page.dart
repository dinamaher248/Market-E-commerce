import 'package:flutter/material.dart';

import 'package:marketi_ecommers/core/utils/image_pathes.dart';
import 'package:marketi_ecommers/core/widgets/bar_widget.dart';
import 'package:marketi_ecommers/core/widgets/four_orgnaized_widget.dart';
import 'package:sizer/sizer.dart';


class SuccessOrderPage extends StatefulWidget {
  const SuccessOrderPage({super.key});

  @override
  State<SuccessOrderPage> createState() => _SuccessOrderPageState();
}

class _SuccessOrderPageState extends State<SuccessOrderPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BarWidget(textBar: "Checkout",),
            FourOrgnaizedWidget(
              image: Image.asset(
                ImagePathes.image11,
                width: 200.w,
                height: 30.h,
              ),
              textBold: "Thank You!",
              textNormal:
                  "Wha, You Have successfully ordered",
              textButton: "Go Home",
            ),
          ],
        ),
      ),
    );
  }
}
