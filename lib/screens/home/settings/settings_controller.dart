import 'package:get/get.dart';

import '../../../database/auth_controller.dart';

class SettingsController extends GetxController {
  void signOutUser() {
    String message = AuthController.instance.signOut() as String;
    if (message != 'success') {
      Get.snackbar('Failed Attempt', message);
    }
  }
}
