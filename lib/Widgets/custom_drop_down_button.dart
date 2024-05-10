import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tecnosoft_task/constants.dart';

class CustomDropDownButton extends StatelessWidget {
  const CustomDropDownButton(
      {super.key,
      this.value,
      required this.hintText,
      this.items,
      this.onChanged});

  final String? value;
  final String hintText;
  final List<DropdownMenuItem<dynamic>>? items;
  final void Function(dynamic)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: const Color(0XFFECF1F4)),
      child: DropdownButton(
        value: value,
        hint: Text(hintText),
        isExpanded: true,
        icon: const Icon(Icons.keyboard_arrow_down_outlined),
        iconSize: 30.h,
        dropdownColor: const Color(0XFFECF1F4),
        style: TextStyle(
          fontFamily: kFontFamily,
          fontSize: 18.sp,
          color: Colors.black,
          fontWeight: FontWeight.w700,
        ),
        underline: Container(),
        borderRadius: BorderRadius.circular(32),
        items: items,
        onChanged: onChanged,
      ),
    );
  }
}
