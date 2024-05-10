import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tecnosoft_task/Views/cart_view.dart';
import 'package:tecnosoft_task/Views/forget_password_view.dart';
import 'package:tecnosoft_task/Views/home_view.dart';
import 'package:tecnosoft_task/Views/item_details_view.dart';
import 'package:tecnosoft_task/Views/login_view.dart';
import 'package:tecnosoft_task/Views/nav_home.dart';
import 'package:tecnosoft_task/Views/onboarding_view.dart';
import 'package:tecnosoft_task/Views/register_view.dart';
import 'package:tecnosoft_task/Views/user_details_view.dart';
import 'package:tecnosoft_task/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const Tecnosoft());
  await ScreenUtil.ensureScreenSize();
}

class Tecnosoft extends StatelessWidget {
  const Tecnosoft({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        ScreenUtil.init(
          context,
          designSize: const Size(414, 854),
        );
        return child!;
      },
      debugShowCheckedModeBanner: false,
      title: 'TecnoSoft',
      routes: {
        HomeView.id: (context) => const HomeView(),
        NavHome.id: (context) => const NavHome(),
        ItemDetails.id: (context) => const ItemDetails(),
        CartView.id: (context) => const CartView(),
        OnboardindView.id: (context) => const OnboardindView(),
        RegisterView.id: (context) => const RegisterView(),
        LoginView.id: (context) => const LoginView(),
        ForgetPasswordView.id: (context) => const ForgetPasswordView(),
        UserDetails.id: (context) => const UserDetails(),
      },
      initialRoute: OnboardindView.id,
    );
  }
}
