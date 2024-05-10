import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:tecnosoft_task/Widgets/app_text.dart';
import 'package:tecnosoft_task/Widgets/custom_app_bar.dart';
import 'package:tecnosoft_task/constants.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  static const String id = 'Cart';

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  int numOfItem = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 40.h),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.w,
              ),
              child: CustomAppBar(
                onTap: () {},
                icon1: FontAwesomeIcons.chevronLeft,
                icon2: FontAwesomeIcons.ellipsis,
                text: "My Cart",
              ),
            ),
            Gap(18.h),
            const Divider(
              thickness: 2,
            ),
            SizedBox(
              height: 400.h,
              width: double.infinity,
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const Column(
                      children: [
                        // CartItem(
                        //   numOfItem: numOfItem,
                        //   onAdd: () {
                        //     setState(() {
                        //       numOfItem++;
                        //     });
                        //   },
                        //   onRemove: () {
                        //     setState(() {
                        //       if (numOfItem > 1) {
                        //         numOfItem--;
                        //       }
                        //     });
                        //   },
                        // ),
                        Divider(
                          thickness: 2,
                        ),
                      ],
                    );
                  }),
            ),
            Gap(18.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  AppText(
                    text: "Subtotal :",
                    size: 20.sp,
                    color: Colors.grey.shade600,
                  ),
                  AppText(
                    text: "\$ 800.00",
                    size: 20.sp,
                    weight: FontWeight.bold,
                  ),
                ],
              ),
            ),
            Gap(16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  AppText(
                    text: "Delivery Fee :",
                    size: 20.sp,
                    color: Colors.grey.shade600,
                  ),
                  AppText(
                    text: "\$ 10.00",
                    size: 20.sp,
                    weight: FontWeight.bold,
                  ),
                ],
              ),
            ),
            Gap(16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  AppText(
                    text: "Discount :",
                    size: 20.sp,
                    color: Colors.grey.shade600,
                  ),
                  AppText(
                    text: "10%",
                    size: 20.sp,
                    weight: FontWeight.bold,
                    color: Colors.red.shade700,
                  ),
                ],
              ),
            ),
            Gap(32.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  AppText(
                    text: "Total :",
                    size: 20.sp,
                    color: Colors.grey.shade600,
                  ),
                  AppText(
                    text: "\$ 780.00",
                    size: 20.sp,
                    weight: FontWeight.bold,
                  ),
                ],
              ),
            ),
            const Spacer(),
            Container(
              constraints: BoxConstraints(minHeight: 50.h),
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: kYallowColor,
                borderRadius: BorderRadius.circular(32.r),
              ),
              child: const Center(
                child: AppText(text: "Check Out"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
