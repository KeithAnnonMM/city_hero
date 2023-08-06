import 'package:city_hero/screens/home/profile/profile_controller.dart';
import 'package:city_hero/services/api_services.dart';
import 'package:get/get.dart';

class ControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<ApiServices>(() => ApiServices());
  }
}
