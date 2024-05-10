import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:tecnosoft_task/Widgets/app_text.dart';
import 'package:tecnosoft_task/constants.dart';

class CoverImage extends StatelessWidget {
  const CoverImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/Images/Jordan.jpg'),
          fit: BoxFit.cover,
          alignment: Alignment.bottomCenter,
        ),
        color: Colors.red,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(0.7),
              Colors.transparent,
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: 16.w,
            right: 16.w,
            top: 35.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AppText(
                text: "Get your \nspecial sale",
                color: Colors.white,
                size: 26.sp,
                textAlign: TextAlign.start,
                weight: FontWeight.w700,
              ),
              Gap(6.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  AppText(
                    text: "Up to 50%",
                    color: kYallowColor,
                    size: 24.sp,
                    weight: FontWeight.bold,
                  ),
                  Container(
                      margin: EdgeInsets.only(bottom: 8.h),
                      height: 40.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        color: kYallowColor,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Center(
                          child: AppText(
                        text: 'Shop Now',
                        size: 16.sp,
                        weight: FontWeight.bold,
                      ))),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
