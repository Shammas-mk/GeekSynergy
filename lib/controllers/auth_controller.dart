import 'package:flutter/material.dart';
import 'package:geeksynergy/helpers/local_storage.dart';
import 'package:geeksynergy/views/home_screen.dart';
import 'package:geeksynergy/views/splash_screen.dart';
import 'package:get/get.dart';

import '../views/login_screen.dart';

class AuthController extends GetxController {
  final formkey = GlobalKey<FormState>();
  final nameComtroller = TextEditingController();
  final emailComtroller = TextEditingController();
  final phoneComtroller = TextEditingController();
  final passwordComtroller = TextEditingController();

  final RxString selectedProfession = 'Doctor'.obs;

  RxBool isLoggedIn = false.obs;

  final List<String> professions = [
    'Doctor',
    'Engineer',
    'Lawyer',
    'Accountant',
    'Teacher'
  ];

  registerUser() async {
    await IdStoring.setName(nameComtroller.text);
    await IdStoring.setEmail(emailComtroller.text);
    await IdStoring.setPhone(phoneComtroller.text);
    await IdStoring.setPassword(passwordComtroller.text);
    await IdStoring.setProfession(selectedProfession.value);
    final data = await IdStoring.getEmail();
    if (data != null) {
      Get.snackbar("Success", "Successfully Registered",
          backgroundColor: Colors.green, colorText: Colors.white);
      Get.offAll(() => const LoginScreen());
      onClose();
    }
  }

  loginUser() async {
    final userName = await IdStoring.getName();
    final userEmail = await IdStoring.getEmail();
    final userPassword = await IdStoring.getPassword();
    if (userName != null) {
      if (userEmail == emailComtroller.text &&
          userPassword == passwordComtroller.text) {
        await IdStoring.setIsLogged(true);
        Get.offAll(() => const HomeScreen());
      } else {
        Get.snackbar("Error", "Invalid Credentials",
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } else {
      Get.snackbar("No user", "No user found",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
    onClose();
  }

  logout() {
    isLoggedIn.value = false;
    IdStoring.setIsLogged(isLoggedIn.value);
    Get.offAll(() => const SplashScreen());
    onClose();
  }

  @override
  void onInit() async {
    isLoggedIn = await IdStoring.getIsLogged();
    super.onInit();
  }

  @override
  void onClose() {
    emailComtroller.clear();
    passwordComtroller.clear();
    nameComtroller.clear();
    phoneComtroller.clear();
    super.onClose();
  }
}
