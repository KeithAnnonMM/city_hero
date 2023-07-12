import 'package:city_hero/screens/login/login.dart';
import 'package:get/get.dart';
import 'package:city_hero/database/auth_controller.dart';

class VerificationController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    sendEmailVerification();
  }

  Future<void> sendEmailVerification() async {
    await AuthController.instance.sendEmailVerification();
  }

  void setTimerForAutoRedirect() {}

  void manuallyCheckEmailVerificationStatus() {
    Get.to(() => const LoginPage());
  }
}
