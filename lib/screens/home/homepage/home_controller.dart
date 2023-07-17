import 'package:city_hero/database/firebase_constants.dart';
import 'package:city_hero/models/user_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final user = auth.currentUser!;
  var data;

  @override
  void onInit() {
    super.onInit();
    data = getUserData(user.email);
  }

  getUserData(email) async {
    final snapshot =
        await db.collection('users').where('email', isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
  }
}
