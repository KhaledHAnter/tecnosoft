import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tecnosoft_task/Helper/show_snackbar.dart';
import 'package:tecnosoft_task/Models/user_details.dart';
import 'package:tecnosoft_task/Views/nav_home.dart';
import 'package:tecnosoft_task/Widgets/app_text.dart';
import 'package:tecnosoft_task/Widgets/app_text_form_field.dart';
import 'package:tecnosoft_task/Widgets/custom_button.dart';
import 'package:tecnosoft_task/Widgets/custom_drop_down_button.dart';
import 'package:tecnosoft_task/constants.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({super.key});

  static String id = 'Home Page';

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  String? dropDownValue;
  String? name, address;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  getToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    print('==============================');
    print(token);
  }

  @override
  void initState() {
    getToken();
    super.initState();
  }

  final _overlayController = OverlayPortalController();

  @override
  Widget build(BuildContext context) {
    return OverlayPortal(
        overlayChildBuilder: (context) {
          return Center(
            child: LoadingAnimationWidget.bouncingBall(
              color: Colors.black,
              size: 100,
            ),
          );
        },
        controller: _overlayController,
        child: Scaffold(
            body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  AppText(
                    text: "User Details",
                    size: 40.sp,
                    weight: FontWeight.w700,
                  ),
                  Gap(8.h),
                  AppText(
                    text:
                        "Please fill in your details so we can match your model perfectly.",
                    size: 16.h,
                    color: kSecondaryFontColor,
                  ),
                  Gap(40.h),
                  Column(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 10,
                      ),
                      child: Form(
                        key: formKey,
                        child: AppTextFormField(
                          onChanged: (p0) {
                            name = p0;
                          },
                          validator: (p0) {
                            if (p0!.isEmpty) {
                              return "Please enter your name";
                            }
                            return null;
                          },
                          labelText: "Name",
                          obscureText: false,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        1,
                        (index) {
                          return Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4,
                                vertical: 10,
                              ),
                              child: CustomDropDownButton(
                                hintText: userDetailsData[index + 2].hintText,
                                value: userDetailsData[index + 2].dropDownValue,
                                onChanged: (value) {
                                  setState(() {
                                    userDetailsData[index + 2].dropDownValue =
                                        value.toString();
                                  });
                                },
                                items: userDetailsData[index + 2]
                                    .listItems
                                    .map((valueItem) {
                                  return DropdownMenuItem(
                                    value: valueItem,
                                    child: Text(valueItem),
                                  );
                                }).toList(),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Gap(16.h),
                    AppTextFormField(
                      onChanged: (p0) {
                        address = p0;
                      },
                      validator: (p0) {
                        if (p0!.isEmpty) {
                          return "Please enter your address";
                        }
                        return null;
                      },
                      labelText: "Address",
                      obscureText: false,
                    ),
                  ]),
                  Gap(40.h),
                  CustomButton(
                    text: "Continue",
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        _overlayController.show();
                        Future.delayed(const Duration(seconds: 3), () {
                          _overlayController.hide();
                          showSnackbar(
                              context,
                              "Congratulation! Your order has placed successfully ",
                              Colors.green);
                          Navigator.pushNamed(context, NavHome.id);
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        )));
  }
}
