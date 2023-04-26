import 'package:flutter/material.dart';
import 'package:geeksynergy/views/home_screen.dart';
import 'package:geeksynergy/views/login_screen.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class SplashScreen extends GetView<AuthController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      if (controller.isLoggedIn.value == false) {
        Get.to(() => const LoginScreen());
      } else {
        Get.to(() => const HomeScreen());
      }
    });
    return const Scaffold(
      body: Center(
        child: SizedBox(
          child: Text(
            'Loading ... ',
            style: TextStyle(
                fontSize: 35, color: Colors.red, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
