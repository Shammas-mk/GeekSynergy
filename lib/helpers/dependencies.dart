import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../controllers/welcome_controller.dart';

class Dependencies {
  init() {
    Get.lazyPut(() => AuthController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
  }
}
