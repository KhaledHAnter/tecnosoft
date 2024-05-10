import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tecnosoft_task/Widgets/app_text.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.icon1,
    required this.icon2,
    required this.text,
    this.color,
    this.onTap,
  });

  final IconData icon1;
  final IconData icon2;
  final String text;
  final Color? color;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 50.h,
            width: 50.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color ?? Colors.grey.shade200,
            ),
            child: Icon(icon1, color: Colors.black),
          ),
        ),
        AppText(
          text: text,
          size: 26.sp,
          weight: FontWeight.w700,
        ),
        Container(
          height: 50.h,
          width: 50.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color ?? Colors.grey.shade200,
          ),
          child: Icon(icon2, color: Colors.black),
        ),
      ],
    );
  }
}
