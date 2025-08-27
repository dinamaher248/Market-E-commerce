import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import 'package:sizer/sizer.dart';

class TextFieldWidget extends StatefulWidget {
  final String mailPassText;
  final IconData icon;
  final TextEditingController? controller;
  final String? errorText;
  final TextInputType? keyboardType; //  for custom keyboard type
  final bool readOnly;
  final VoidCallback? onTap;
  final bool? isEdit;
  final String? hintText;
  const TextFieldWidget({
    super.key,
    required this.mailPassText,
    required this.icon,
    this.controller,
    this.errorText,
    this.keyboardType,
    this.readOnly = false,
    this.onTap,
    this.isEdit = false,
    this.hintText,
  });
  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool isPasswordVisible = false;

@override
  void dispose() {
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 6.6.h,
          width: 86.5.w,
          child: Card(
            color: Colors.white,
            child: TextFormField(
              controller: widget.controller,
              readOnly: widget.readOnly,
              obscureText: widget.mailPassText == 'Password' ||
                      widget.mailPassText == 'Confirm Password'
                  ? !isPasswordVisible
                  : false,
              cursorColor: PrimaryColor,
              keyboardType: widget.keyboardType ??
                  (widget.mailPassText == 'Email'
                      ? TextInputType.emailAddress
                      : TextInputType.text),
              decoration: InputDecoration(
                labelText: widget.mailPassText,
                labelStyle: widget.isEdit == false
                    ? TextStyle(
                        fontSize: 15.sp,
                        color: const Color(0xFF929BAB),
                      )
                    : null,
                suffixIcon: widget.mailPassText == 'Password' ||
                        widget.mailPassText == 'Confirm Password'
                    ? IconButton(
                        icon: Icon(
                          isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                      )
                    : (widget.isEdit == true
                        ? IconButton(
                            icon: Icon(
                              Icons.edit,
                              // : Icons.done,
                              color: PrimaryColor,
                              size: 5.w,
                            ),
                            onPressed: () {
                              setState(() {
                                // isPasswordVisible = !isPasswordVisible;
                              });
                            },
                          )
                        : null),
                prefixIcon: Icon(
                  widget.icon,
                  size: 4.3.w,
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.black45
                      : PrimaryColor,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3.w),
                  borderSide: const BorderSide(
                    color: Color(0xffb2ccffb2),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3.w),
                  borderSide: const BorderSide(
                    color: Colors.green,
                  ),
                ),
                errorText: widget.errorText,
              ),
              onTap: widget.onTap,
            ),
          ),
        ),
      ],
    );
  }
}
