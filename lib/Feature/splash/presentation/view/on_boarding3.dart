import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/routing/app_router.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/image_pathes.dart';
import '../../../../core/widgets/core/custom_button.dart';
import 'widgets/onboarding_widget.dart';

class OnBoarding3 extends StatelessWidget {
  const OnBoarding3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
              ? Colors.white
              : Colors.black ,
      body: Column(
        children: [
          OnboardingWidget(
            text1: "Wonderful User Experience",
            text2:
                "Start exploring now and experience the convenience of online shopping at its best.",
            image: ImagePathes.image3,
            indexOfDOt: 2,
          ),
          const Spacer(),
          CustomButton(
            button: "Get Start",
            onPressed: () {
              context.push(AppRouter.loginPath);
            },
            groundColor: PrimaryColor,
            textcolor: Colors.white,
          ),
          SizedBox(
            height: 5.h,
          )
        ],
      ),
    );
  }
}
