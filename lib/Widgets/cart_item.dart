import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:tecnosoft_task/Widgets/app_text.dart';

class CartItem extends StatelessWidget {
  const CartItem(
      {super.key,
      required this.numOfItem,
      this.onAdd,
      this.onRemove,
      required this.name,
      required this.image,
      required this.price,
      required this.gender});

  final int numOfItem;

  final void Function()? onAdd;

  final void Function()? onRemove;

  final String name, image, gender;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        height: 135.h,
        width: double.infinity,
        decoration: const BoxDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade200,
              ),
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.45,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: name,
                    size: 16.sp,
                    weight: FontWeight.bold,
                    textAlign: TextAlign.start,
                  ),
                  Gap(4.h),
                  AppText(
                    text: gender,
                    size: 16.sp,
                    color: Colors.grey.shade600,
                  ),
                  const Spacer(),
                  AppText(
                    text: "\$ $price",
                    size: 20.sp,
                    weight: FontWeight.bold,
                  ),
                ],
              ),
            ),
            SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  const Spacer(),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(32.r),
                    ),
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: onRemove,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: const Color.fromARGB(255, 7, 56, 129),
                                  width: 2),
                            ),
                            child: const Icon(
                              Icons.remove,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: AppText(
                            text: "$numOfItem",
                            color: const Color.fromARGB(255, 7, 56, 129),
                          ),
                        ),
                        GestureDetector(
                          onTap: onAdd,
                          child: Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 7, 56, 129)),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
