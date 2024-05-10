import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tecnosoft_task/Widgets/app_text.dart';
import 'package:tecnosoft_task/constants.dart';

class appButton extends StatelessWidget {
  const appButton({super.key, required this.text, this.onTap, this.color});
  final String text;
  final void Function()? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: BoxConstraints(
          minWidth: double.infinity,
          minHeight: 55.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: color ?? kYallowColor.withOpacity(.85),
        ),
        child: Center(
          child: AppText(
            text: text,
            weight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
