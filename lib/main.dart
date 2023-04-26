import 'package:flutter/material.dart';
import 'package:geeksynergy/helpers/dependencies.dart';
import 'package:geeksynergy/helpers/local_storage.dart';
import 'package:geeksynergy/views/splash_screen.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Dependencies().init();
  IdStoring.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GeekSynergy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
