import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:tecnosoft_task/Widgets/app_text.dart';

class ProductCardBestSeller extends StatelessWidget {
  const ProductCardBestSeller({
    super.key,
    required this.name,
    required this.desc,
    required this.image,
    required this.gender,
    required this.price,
    this.onTap,
  });

  final String name, desc, image, gender;
  final double price;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.w),
      child: SizedBox(
        width: 200.w,
        child: Column(
          children: [
            Container(
              width: 200.w,
              height: 180.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade200,
              ),
              child: GestureDetector(
                onTap: onTap,
                child: Container(
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(image),
                      fit: BoxFit.contain,
                    ),
                  ),
                  child: UnconstrainedBox(
                    child: Container(
                      margin: const EdgeInsets.all(16),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade200,
                      ),
                      child: const Icon(FontAwesomeIcons.heart),
                    ),
                  ),
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
