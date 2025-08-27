import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/routing/app_router.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/image_pathes.dart';
import '../../../../core/widgets/core/custom_button.dart';
import 'widgets/onboarding_widget.dart';

class OnBoarding1 extends StatelessWidget {
  const OnBoarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Theme.of(context).brightness == Brightness.light
              ? Colors.white
              : Colors.black ,
      body: Column(
        children: [
          OnboardingWidget(
            text1: "Welcome to Marketi",
            text2:
                "Discover a world of endless possibilities and shop from the comfort of your fingertips Browse through a wide range of products, from fashion and electronics to home.",
            image: ImagePathes.image1,
            indexOfDOt: 0,
            
          ),
          const Spacer(),
          CustomButton(
            button: "Next",
            onPressed: () {
              context.push(AppRouter.onBoarding2Path);
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
