import 'package:flutter/material.dart';
import 'package:geeksynergy/controllers/auth_controller.dart';
import 'package:geeksynergy/views/login_screen.dart';
import 'package:geeksynergy/widgets/textformfield.dart';
import 'package:get/get.dart';

class RegisterScreen extends GetView<AuthController> {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                const Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                TextFormFieldWidget(
                  controller: controller.nameComtroller,
                  labelText: 'Name',
                  hindText: 'Enter the name',
                ),
                TextFormFieldWidget(
                  controller: controller.emailComtroller,
                  labelText: 'Email',
                  hindText: 'Enter the email',
                ),
                TextFormFieldWidget(
                  controller: controller.phoneComtroller,
                  labelText: 'Phone Number',
                  hindText: 'Enter the phone',
                ),
                TextFormFieldWidget(
                  controller: controller.passwordComtroller,
                  labelText: 'Password',
                  hindText: 'Enter the password',
                ),
                Obx(() => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 16.0),
                      child: DropdownButtonFormField(
                        value: controller.selectedProfession.value,
                        onChanged: (String? newValue) {
                          controller.selectedProfession.value = newValue!;
                        },
                        items: controller.professions.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    )),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account ?"),
                    TextButton(
                      onPressed: () {
                        Get.to(() => const LoginScreen());
                      },
                      child: const Text('Login'),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        controller.registerUser();
                      },
                      child: const Text('Submit'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
