import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:ionicons/ionicons.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tecnosoft_task/Helper/show_snackbar.dart';
import 'package:tecnosoft_task/Services/auth_service.dart';
import 'package:tecnosoft_task/Views/forget_password_view.dart';
import 'package:tecnosoft_task/Views/nav_home.dart';
import 'package:tecnosoft_task/Widgets/app_button.dart';
import 'package:tecnosoft_task/Widgets/app_text.dart';
import 'package:tecnosoft_task/Widgets/app_text_form_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  static String id = "Login";

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String? email, password;
  bool obscureText = true, autoValidate = false, isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AppText(
                    text: "Welcome back,",
                    size: 20.sp,
                    weight: FontWeight.w700,
                  ),
                  Gap(8.h),
                  AppText(
                    text:
                        "Discover Limitless Experience Of Shoses Online Shopping With Tecnosoft,",
                    color: Colors.grey.shade600,
                    textAlign: TextAlign.start,
                    size: 16.sp,
                    weight: FontWeight.w700,
                  ),
                  Gap(40.h),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        AppTextFormField(
                          labelText: "E-Mail",
                          obscureText: false,
                          prefixIcon: Icons.email,
                          keyboardType: TextInputType.emailAddress,
                          autoValidate: autoValidate,
                          onChanged: (value) {
                            setState(() {
                              email = value;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!(value.contains('.com') &&
                                value.contains('@'))) {
                              return 'Invalid Email';
                            }
                            return null;
                          },
                        ),
                        Gap(16.h),
                        AppTextFormField(
                          labelText: "Password",
                          obscureText: obscureText,
                          prefixIcon: Icons.password,
                          keyboardType: TextInputType.visiblePassword,
                          autoValidate: autoValidate,
                          suffixIcon:
                              obscureText ? Ionicons.eye : Ionicons.eye_off,
                          onSuffixTap: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                          onChanged: (value) {
                            setState(() {
                              password = value;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            if (value.length < 8) {
                              return 'password must be at least 8 characters';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  Gap(18.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, ForgetPasswordView.id);
                        },
                        child: AppText(
                          text: "Forget Password?",
                          color: Colors.grey.shade600,
                          size: 14.sp,
                          decoretions: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                  Gap(40.h),
                  appButton(
                    text: "Login",
                    onTap: () async {
                      _overlayController.show();

                      if (formKey.currentState!.validate()) {
                        print("vaild");
                        try {
                          await loginUser(email: email, password: password);

                          Navigator.pushNamed(context, NavHome.id);
                          showSnackbar(
                            context,
                            "successful registration",
                            Colors.green,
                          );
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'wrong-password') {
                            showSnackbar(
                              context,
                              "wrong password",
                              Colors.red,
                            );
                          } else if (e.code == 'user-not-found') {
                            showSnackbar(
                              context,
                              "user not found",
                              Colors.red,
                            );
                          }
                        } on Exception catch (e) {
                          log(e.toString());
                        }
                      } else {
                        setState(() {
                          autoValidate = !autoValidate;
                        });
                        print("not vaild");
                      }
                      _overlayController.hide();
                    },
                  ),
                  Gap(40.h),
                  Center(
                      child: AppText(
                    text: "or sign up with",
                    color: Colors.grey.shade600,
                    size: 16.sp,
                  )),
                  Gap(24.h),
                  Row(
                    children: <Widget>[
                      const Spacer(),
                      Container(
                        constraints:
                            BoxConstraints(minHeight: 35.h, minWidth: 35.w),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: const FittedBox(
                          child: Icon(
                            Ionicons.logo_google,
                          ),
                        ),
                      ),
                      Gap(MediaQuery.of(context).size.width * 0.1),
                      Container(
                        constraints:
                            BoxConstraints(minHeight: 35.h, minWidth: 35.w),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: const FittedBox(
                          child: Icon(
                            Ionicons.logo_facebook,
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
