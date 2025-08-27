import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/routing/app_router.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/image_pathes.dart';
import '../../../../core/widgets/core/custom_button.dart';
import 'widgets/onboarding_widget.dart';

class OnBoarding2 extends StatelessWidget {
  const OnBoarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
              ? Colors.white
              : Colors.black ,
      body: Column(
        children: [
          OnboardingWidget(
                      text1: "Easy to Buy",
                      text2:
            "Find the perfect item that suits your style and needs With secure payment options and fast delivery, shopping has never been easier.",
                      image: ImagePathes.image2,
                      indexOfDOt: 1,
                      
                    ),
          const Spacer(),
          CustomButton(
            button: "Next",
            onPressed: () {
              context.push(AppRouter.onBoarding3Path);
            },
            groundColor: PrimaryColor,
            textcolor: Colors.white,
          ),
          SizedBox(height: 5.h,)
        ],
      ),
    );
  }
}
