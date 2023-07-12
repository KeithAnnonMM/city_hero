import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'package:city_hero/screens/home/homepage/homepage.dart';
import 'package:city_hero/screens/login/login.dart';
import 'package:city_hero/screens/mailVerification/mail_verification.dart';

import 'database.dart';
import 'firebase_constants.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  late Rx<User?> firebaseUser;

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const HomePage());
      } else {
        Get.offAll(() => MailVerification(email: user.email));
      }
    } else {
      Get.offAll(() => const LoginPage());
    }
  }

  bool isUserVerified() {
    return auth.currentUser!.emailVerified;
  }

  Future<String> createNewAccount({
    required String email,
    required String password,
    required String contact,
    required String fullName,
    required String location,
  }) async {
    try {
      await auth
          .createUserWithEmailAndPassword(
              email: email.trim(), password: password.trim())
          .then(
            (value) => addUserInfo(
                fullName: fullName,
                location: location,
                contact: contact,
                email: email),
          );
      return 'Success';
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.message.toString());
      return e.message.toString();
    } catch (e) {
      Get.snackbar('Error', e.toString());
      return e.toString();
    }
  }

  Future<String> sendEmailVerification() async {
    try {
      await auth.currentUser?.sendEmailVerification();
      return "Success";
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.message.toString());
      return e.message.toString();
    } catch (e) {
      Get.snackbar('Error', e.toString());
      return e.toString();
    }
  }

  Future<String> signInUser(
      {required String email, required String password}) async {
    try {
      await auth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      return "Success";
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', 'Email and Password do not correspond to any user');
      return e.message.toString();
    } catch (e) {
      Get.snackbar('Error', e.toString());
      return e.toString();
    }
  }

  Future<String> signOut() async {
    try {
      await auth.signOut();
      return "Success";
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.message.toString());
      return e.message.toString();
    } catch (e) {
      Get.snackbar('Error', e.toString());
      return e.toString();
    }
  }
}
