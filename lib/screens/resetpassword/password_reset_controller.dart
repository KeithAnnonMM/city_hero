import 'package:get/get.dart';

import '../../database/firebase_constants.dart';

class PasswordResetController extends GetxController {
  static PasswordResetController instance = Get.find();
  late String email;

  Future<void> resetPassword() async {
    await auth.sendPasswordResetEmail(email: email);
  }
}
