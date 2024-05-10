import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:tecnosoft_task/Widgets/app_text.dart';

class ProductCardNewArival extends StatelessWidget {
  const ProductCardNewArival(
      {super.key,
      this.onTap,
      required this.name,
      required this.desc,
      required this.image,
      required this.gender,
      required this.price});

  final void Function()? onTap;

  final String name, desc, image, gender;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.w),
      child: SizedBox(
        width: 180,
        child: Column(
          children: [
            GestureDetector(
              onTap: onTap,
              child: Container(
                width: 180.w,
                height: 120.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey.shade200,
                ),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Gap(8.h),
            AppText(
              text: name,
              textAlign: TextAlign.start,
              size: 18.sp,
              weight: FontWeight.bold,
            ),
            Gap(4.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: gender,
                      size: 16.sp,
                      color: Colors.grey.shade700,
                    ),
                    Gap(2.h),
                    AppText(
                      text: "\$ $price",
                      size: 22.sp,
                      weight: FontWeight.bold,
                    ),
                  ],
                ),
                Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade200,
                  ),
                  child: const Icon(FontAwesomeIcons.heart),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
