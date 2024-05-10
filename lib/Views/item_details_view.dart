import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:tecnosoft_task/Helper/show_snackbar.dart';
import 'package:tecnosoft_task/Models/item_model.dart';
import 'package:tecnosoft_task/Services/items_services.dart';
import 'package:tecnosoft_task/Widgets/app_text.dart';
import 'package:tecnosoft_task/Widgets/custom_app_bar.dart';
import 'package:tecnosoft_task/constants.dart';

class ItemDetails extends StatefulWidget {
  const ItemDetails({super.key});

  static String id = 'Item Details';

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  int _currentPhotoIndex = 0;
  int _currentSizeIndex = 0;
  int numOfItem = 1;

  @override
  Widget build(BuildContext context) {
    var product = ModalRoute.of(context)!.settings.arguments as ItemModel;
    print(product);
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: EdgeInsets.only(top: 40.h, bottom: 8.h),
        child: Column(
          children: <Widget>[
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: CustomAppBar(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      icon1: FontAwesomeIcons.chevronLeft,
                      icon2: FontAwesomeIcons.ellipsis,
                      text: "Details Product",
                      color: Colors.grey.shade100,
                    ),
                  ),
                  Gap(2.h),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 12.w),
                    width: double.infinity,
                    height: 250.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              NetworkImage(product.images[_currentPhotoIndex]),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      product.images.length,
                      (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _currentPhotoIndex = index;
                            });
                          },
                          child: Container(
                            constraints:
                                BoxConstraints(minHeight: 65.h, minWidth: 65.w),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(product.images[index]),
                                fit: BoxFit.contain,
                              ),
                              color: Colors.grey.shade200,
                              shape: BoxShape.circle,
                              border: _currentPhotoIndex == index
                                  ? Border.all(
                                      color: kYallowColor,
                                      width: 3,
                                    )
                                  : null,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Gap(16.h),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 18.h),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32.r),
                    topRight: Radius.circular(32.r),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AppText(
                      text: product.name,
                      size: 26.sp,
                      weight: FontWeight.bold,
                      textAlign: TextAlign.start,
                    ),
                    Gap(4.h),
                    AppText(
                      text: product.gender,
                      color: Colors.grey.shade600,
                    ),
                    Gap(8.h),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "\$ ${product.price}   ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 28.sp,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          TextSpan(
                            text: "\$500.0",
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              decorationColor: Colors.red,
                              decorationThickness: 2,
                              color: Colors.red,
                              fontSize: 26.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Gap(8.h),
                    SizedBox(
                      height: 50.h,
                      width: double.infinity,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: product.sizes.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _currentSizeIndex = index;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 8.w),
                              constraints: BoxConstraints(
                                  minHeight: 50.h, minWidth: 50.w),
                              decoration: BoxDecoration(
                                border: _currentSizeIndex == index
                                    ? Border.all(width: 2)
                                    : null,
                                shape: BoxShape.circle,
                                color: Colors.grey.shade100,
                              ),
                              child: Center(
                                  child: AppText(
                                      size: 18.sp,
                                      text: product.sizes[index].toString())),
                            ),
                          );
                        },
                      ),
                    ),
                    Gap(8.h),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const AppText(
                                text: "Description\n",
                                weight: FontWeight.bold,
                              ),
                              content: AppText(
                                text: product.desc,
                                textAlign: TextAlign.start,
                              ),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 8.w),
                            );
                          },
                        );
                      },
                      child: AppText(
                        size: 18.sp,
                        text: "Description  \nClick here for more details",
                        weight: FontWeight.bold,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    // Gap(4.h),
                    const Spacer(),
                    Divider(
                      thickness: 2,
                      height: 30.h,
                    ),
                    Row(
                      children: [
                        ...List.generate(avatars.length, (index) {
                          return Container(
                            constraints:
                                BoxConstraints(minHeight: 30.h, minWidth: 30.w),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(avatars[index]),
                              ),
                            ),
                          );
                        }),
                        Gap(12.w),
                        AppText(
                          text: "10.000+ people favorited",
                          size: 14.sp,
                          color: Colors.grey.shade600,
                        ),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
            // add to cart button
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
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
                            onTap: () {
                              setState(() {
                                if (numOfItem > 1) {
                                  numOfItem--;
                                }
                              });
                            },
                            child: Container(
                              constraints: BoxConstraints(
                                  minHeight: 35.h, minWidth: 35.w),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color:
                                        const Color.fromARGB(255, 7, 56, 129),
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
                            onTap: () {
                              setState(() {
                                numOfItem++;
                              });
                            },
                            child: Container(
                              constraints: BoxConstraints(
                                  minHeight: 35.h, minWidth: 35.w),
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
                    Gap(16.w),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          addToCart(
                              id: product.id,
                              price: product.price,
                              quantity: numOfItem,
                              size: product.sizes[_currentSizeIndex]);
                          showSnackbar(context,
                              'Item Added to cart successfully', Colors.green);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 12.h),
                          decoration: BoxDecoration(
                            color: kYallowColor,
                            borderRadius: BorderRadius.circular(32.r),
                          ),
                          child: const Center(
                            child: AppText(text: "Add to cart"),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final List<String> avatars = [
  "assets/Images/avatars/1.jpg",
  "assets/Images/avatars/2.jpg",
  "assets/Images/avatars/3.jpg",
  "assets/Images/avatars/4.jpg",
];
