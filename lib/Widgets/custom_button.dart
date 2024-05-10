import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tecnosoft_task/Widgets/app_text.dart';
import 'package:tecnosoft_task/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTap,
    this.color,
    this.textColor,
    required this.text,
  });

  final void Function()? onTap;
  final Color? color, textColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 54.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: color ?? kYallowColor,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Center(
          child: AppText(
            text: text,
            size: 20.sp,
            weight: FontWeight.w900,
            color: textColor ?? Colors.black,
          ),
        ),
      ),
    );
  }
}
