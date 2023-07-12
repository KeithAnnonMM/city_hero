import 'package:city_hero/database/firebase_constants.dart';
import 'package:get/get.dart';

import '../../../models/user_model.dart';

class ProfileController extends GetxController {
  var data;

  @override
  void onInit() {
    super.onInit();
    data = getUserData(user.email);
  }

  final user = auth.currentUser!;

  getUserData(email) async {
    final snapshot =
        await db.collection('users').where('email', isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
  }
}
