import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tecnosoft_task/Models/category_model.dart';
import 'package:tecnosoft_task/Models/item_model.dart';
import 'package:tecnosoft_task/Views/item_details_view.dart';
import 'package:tecnosoft_task/Widgets/app_text.dart';
import 'package:tecnosoft_task/Widgets/cover_image.dart';
import 'package:tecnosoft_task/Widgets/custom_app_bar.dart';
import 'package:tecnosoft_task/Widgets/item_card_bestseller.dart';
import 'package:tecnosoft_task/Widgets/item_card_newarival.dart';
import 'package:tecnosoft_task/constants.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  static String id = "Home";

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<ItemModel> products = [];

  getData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("Items").orderBy('id').get();
    setState(() {
      // products.addAll();
      for (int i = 0; i < querySnapshot.docs.length; i++) {
        products.add(ItemModel.fromJson(querySnapshot.docs[i].data()));
      }
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const CustomAppBar(
                icon1: FontAwesomeIcons.bars,
                icon2: FontAwesomeIcons.bell,
                text: "Shopink",
              ),
              Gap(30.h),
              const CoverImage(),
              Gap(20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  AppText(
                    text: "New Arrivals",
                    weight: FontWeight.w700,
                    size: 24.sp,
                  ),
                  AppText(
                    text: "See all",
                    size: 18.sp,
                    color: Colors.grey.shade600,
                  ),
                ],
              ),
              // AppText(text: "${products[0]["name"]}"),
              Gap(16.h),
              SizedBox(
                width: double.infinity,
                height: 250.h,
                child: products.isEmpty
                    ? LoadingAnimationWidget.dotsTriangle(
                        color: Colors.black, size: 100)
                    : ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: products.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return ProductCardNewArival(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                ItemDetails.id,
                                arguments: products[index],
                              );
                              print(products[index].name + index.toString());
                            },
                            name: products[index].name,
                            image: products[index].images[0],
                            desc: products[index].desc,
                            gender: products[index].gender,
                            price: products[index].price,
                          );
                        },
                      ),
              ),
              Gap(20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  AppText(
                    text: "Best Seller",
                    size: 24.sp,
                    weight: FontWeight.w700,
                  ),
                  AppText(
                    text: "See all",
                    size: 18.sp,
                    color: Colors.grey.shade600,
                  ),
                ],
              ),
              Gap(16.h),
              SizedBox(
                width: double.infinity,
                height: 40.h,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryData.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 16.w),
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 8.h),
                        constraints:
                            BoxConstraints(minHeight: 20.h, minWidth: 30.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: _currentIndex == index
                              ? kYallowColor
                              : Colors.grey.shade200.withOpacity(0.7),
                        ),
                        child: Center(
                          child: AppText(
                            size: 16.sp,
                            text: categoryData[index],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Gap(16.h),
              SizedBox(
                height: 350.h,
                width: double.infinity,
                child: products.isEmpty
                    ? LoadingAnimationWidget.dotsTriangle(
                        color: Colors.black, size: 100)
                    : ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: products.length - 4,
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return ProductCardBestSeller(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                ItemDetails.id,
                                arguments: products[index + 4],
                              );
                              print(
                                  products[index + 4].name + index.toString());
                            },
                            name: products[index + 4].name,
                            image: products[index + 4].images[0],
                            desc: products[index + 4].desc,
                            gender: products[index + 4].gender,
                            price: products[index + 4].price,
                          );
                        },
                      ),
              ),
              Gap(16.h),
            ],
          ),
        ),
      ),
    );
  }
}
