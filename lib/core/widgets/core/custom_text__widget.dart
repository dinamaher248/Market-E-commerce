import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({super.key, 
    required this.color,
    required this.fontSize,
    this.fontWeight,
    required this.text,
    this.textAlign,
    this.maxLines = 3,
    this.isThemeColor=true,
  });
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final int? maxLines;
  final bool isThemeColor;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.center,
      maxLines: maxLines,
      softWrap: true, 
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.poppins(
        color: isThemeColor? Theme.of(context).colorScheme.onSurface : color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
