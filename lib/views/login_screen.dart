import 'package:flutter/material.dart';
import 'package:geeksynergy/controllers/auth_controller.dart';
import 'package:geeksynergy/views/register_screen.dart';
import 'package:geeksynergy/widgets/textformfield.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Login',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            TextFormFieldWidget(
              controller: controller.emailComtroller,
              labelText: 'Email',
              hindText: 'Enter the email',
            ),
            TextFormFieldWidget(
              controller: controller.passwordComtroller,
              hindText: 'Enter the password',
              labelText: 'Password',
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account ?"),
                TextButton(
                  onPressed: () {
                    Get.to(() => const RegisterScreen());
                  },
                  child: const Text('Sign up'),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      controller.loginUser();
                    },
                    child: const Text('Login')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
