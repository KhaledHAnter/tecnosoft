import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:ionicons/ionicons.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tecnosoft_task/Helper/show_snackbar.dart';
import 'package:tecnosoft_task/Services/auth_service.dart';
import 'package:tecnosoft_task/Views/nav_home.dart';
import 'package:tecnosoft_task/Widgets/app_button.dart';
import 'package:tecnosoft_task/Widgets/app_text.dart';
import 'package:tecnosoft_task/Widgets/app_text_form_field.dart';
import 'package:tecnosoft_task/constants.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  static String id = "Register";

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  String? email, password, rePassword;
  bool obscureText = true,
      reObscureText = true,
      autoValidate = false,
      isLoading = false,
      checkboxValue = false;

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
                        Gap(16.h),
                        AppTextFormField(
                          labelText: "Re-write Password",
                          obscureText: reObscureText,
                          prefixIcon: Icons.password,
                          keyboardType: TextInputType.visiblePassword,
                          autoValidate: autoValidate,
                          suffixIcon:
                              reObscureText ? Ionicons.eye : Ionicons.eye_off,
                          onSuffixTap: () {
                            setState(() {
                              reObscureText = !reObscureText;
                            });
                          },
                          onChanged: (value) {
                            setState(() {
                              rePassword = value;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            if (value.length < 8 || !(value == password)) {
                              return 'Passwords do not match';
                            }

                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  Gap(24.h),
                  Row(
                    children: <Widget>[
                      Checkbox(
                        checkColor: Colors.black.withOpacity(0.6),
                        activeColor: kYallowColor,
                        value: checkboxValue,
                        onChanged: (value) {
                          setState(
                            () {
                              checkboxValue = value!;
                            },
                          );
                        },
                      ),
                      AppText(
                        text: "I agree to the policy & terms",
                        size: 14.sp,
                      )
                    ],
                  ),
                  Gap(20.h),
                  appButton(
                    text: "Register",
                    onTap: () async {
                      _overlayController.show();

                      if (formKey.currentState!.validate()) {
                        print("vaild");
                        try {
                          await registerUser(email: email, password: password);

                          Navigator.pushNamed(context, NavHome.id);
                          showSnackbar(
                            context,
                            "successful registration",
                            Colors.green,
                          );
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'email-already-in-use') {
                            showSnackbar(
                              context,
                              "Email already exist",
                              Colors.red,
                            );
                          }
                        } catch (e) {
                          print(e);
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
                      GestureDetector(
                        onTap: () {
                          signInWithGoogle();
                        },
                        child: Container(
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
