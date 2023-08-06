import 'package:get/get.dart';

import '../../../database/auth_controller.dart';

class SettingsController extends GetxController {
  void signOutUser() {
    AuthController.instance.signOut() as String;
  }
}
