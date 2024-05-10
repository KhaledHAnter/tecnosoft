import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:tecnosoft_task/Helper/show_snackbar.dart';
import 'package:tecnosoft_task/Widgets/app_button.dart';
import 'package:tecnosoft_task/Widgets/app_text.dart';
import 'package:tecnosoft_task/Widgets/app_text_form_field.dart';
import 'package:tecnosoft_task/constants.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  static String id = 'Forget Password';

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  String? email;
  bool autoValidate = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     addItem(
      //       id: 12,
      //       name: "Dunk Low Varsity Green",
      //       desc:
      //           "ntroduced over three decades ago, the Dunk Low began its reign on the college basketball hardwood. Since then, it has become an icon of expression in nearly every crevice of popular culture from skate to modern art.",
      //       price: 299.00,
      //       sizes: [38, 39, 40, 41, 42, 43, 44, 45],
      //       images: [
      //         "https://firebasestorage.googleapis.com/v0/b/tecnosoft-226cf.appspot.com/o/images%2F12%2F1.png?alt=media&token=4b2ec86b-b64c-4574-bc60-7ed518904274",
      //         "https://firebasestorage.googleapis.com/v0/b/tecnosoft-226cf.appspot.com/o/images%2F12%2F2.png?alt=media&token=cf9cf186-bc6d-4707-9589-8b6ad884e484",
      //         "https://firebasestorage.googleapis.com/v0/b/tecnosoft-226cf.appspot.com/o/images%2F12%2F3.png?alt=media&token=b2107a7f-a250-44b7-ae57-99fed6a22bba",
      //         "https://firebasestorage.googleapis.com/v0/b/tecnosoft-226cf.appspot.com/o/images%2F12%2F4.png?alt=media&token=0843af4d-f71f-4d86-9b06-ef19b091802b",
      //         "https://firebasestorage.googleapis.com/v0/b/tecnosoft-226cf.appspot.com/o/images%2F12%2F5.png?alt=media&token=6f7b6e9f-3006-4184-802a-5f2e5a11c5e4"
      //       ],
      //       gender: "Men's Shoes",
      //     );
      //   },
      // ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppText(
              text: 'Forget Password ',
              size: 24.sp,
              weight: FontWeight.bold,
            ),
            Gap(6.h),
            AppText(
              text: 'Enter your email to reset password',
              weight: FontWeight.w600,
              color: Colors.grey.shade600,
            ),
            Gap(40.h),
            Form(
              key: formKey,
              child: AppTextFormField(
                autoValidate: autoValidate,
                labelText: "E-Mail",
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icons.email,
                onChanged: (p0) {
                  setState(() {
                    email = p0;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!(value.contains('.com') && value.contains('@'))) {
                    return 'Invalid Email';
                  }
                  return null;
                },
              ),
            ),
            Gap(40.h),
            appButton(
              onTap: () async {
                if (!((email == null) || (email!.isEmpty)) &&
                    formKey.currentState!.validate()) {
                  try {
                    await FirebaseAuth.instance
                        .sendPasswordResetEmail(email: email!);
                    Navigator.pop(context);
                    showSnackbar(
                        context, "Rest Password Email Sent", Colors.green);
                  } on Exception catch (e) {
                    print(e);
                  }
                } else {
                  setState(() {
                    autoValidate = !autoValidate;
                  });
                }
              },
              text: "Send To Email",
              color: email == null ? Colors.grey.shade400 : kYallowColor,
            )
          ],
        ),
      ),
    );
  }
}
