import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:tecnosoft_task/Models/onborad_model.dart';
import 'package:tecnosoft_task/Views/login_view.dart';
import 'package:tecnosoft_task/Views/register_view.dart';
import 'package:tecnosoft_task/Widgets/app_text.dart';
import 'package:tecnosoft_task/Widgets/dot_indicator.dart';
import 'package:tecnosoft_task/constants.dart';

class OnboardindView extends StatefulWidget {
  const OnboardindView({super.key});

  static const String id = 'Onboarding';

  @override
  State<OnboardindView> createState() => _OnboardindViewState();
}

class _OnboardindViewState extends State<OnboardindView> {
  bool notLastPage = true;
  late PageController _pageController;
  int _pageIndex = 0;
  late Timer _timer;
  final int _numPages = 5;

  @override
  void initState() {
    _pageController = PageController(initialPage: _pageIndex);
    _startAutoPlay();

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  void _startAutoPlay() {
    _timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      if (_pageIndex < _numPages - 1) {
        _pageIndex++;
      } else {
        _pageIndex = 0;
      }
      _pageController.animateToPage(
        _pageIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 75,
              child: PageView.builder(
                itemCount: onboardData.length,
                onPageChanged: (value) {
                  setState(() {
                    _pageIndex = value;
                    
                    
                  });
                },
                controller: _pageController,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      Expanded(
                        flex: 80,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                onboardData[index].image,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Gap(16.h),
                      Expanded(
                        flex: 20,
                        child: Container(
                          child: Column(
                            children: [
                              AppText(
                                fontFamily: "Poppins",
                                text: onboardData[index].title,
                                size: 24.sp,
                                weight: FontWeight.w700,
                                color: Colors.black,
                              ),
                              Gap(8.h),
                              AppText(
                                fontFamily: "Poppins",
                                text: onboardData[index].description,
                                size: 18.sp,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Expanded(
                flex: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(onboardData.length, (index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        right: 4.w,
                      ),
                      child: DotIndicator(
                        isActive: index == _pageIndex,
                      ),
                    );
                  }),
                )),
            Expanded(
              flex: 20,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RegisterView.id);
                      },
                      child: Container(
                        constraints: BoxConstraints(
                            minWidth: double.infinity, minHeight: 60.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: kYallowColor.withOpacity(0.8),
                        ),
                        child: Center(
                          child: AppText(
                            text: "Get Started",
                            fontFamily: "Poppins",
                            size: 22.sp,
                            weight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, LoginView.id);
                      },
                      child: AppText(
                        text: "I Already Have An Account",
                        fontFamily: "Poppins",
                        size: 18.sp,
                        weight: FontWeight.w600,
                      ),
                    ),
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
