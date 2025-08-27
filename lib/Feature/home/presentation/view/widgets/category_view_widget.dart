import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi_ecommers/core/widgets/core/custom_text__widget.dart';
import 'package:sizer/sizer.dart';

class CategoryViewWidget extends StatelessWidget {
  CategoryViewWidget({super.key, required this.text, required this.location});
  String text;
  String location;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTextWidget(
              color: Theme.of(context).colorScheme.onSurface, //TextColor,
              fontSize: 5.w,
              fontWeight: FontWeight.w600,
              text: text),
          InkWell(
            onTap: () {
              context.go(location);
            },
            child: CustomTextWidget(
                isThemeColor: false,
                color: const Color(0xff3F80FF),
                fontSize: 5.w,
                fontWeight: FontWeight.w500,
                text: "View all"),
          ),
        ],
      ),
    );
  }
}
