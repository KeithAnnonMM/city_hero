import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:city_hero/database/firebase_constants.dart';

import '../../database/auth_controller.dart';

class SignUpController extends GetxController {
  var isVisible1 = true.obs;
  var isVisible2 = true.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final fullNameController = TextEditingController();
  final contactController = TextEditingController();
  CollectionReference collectionReference = db.collection('users');

  List<String> areas = [
    'Katete',
    'Kizungu',
    'Taso Village',
    'Booma',
    'Nyamitanga'
  ];

  var isCheckedAgreement = false.obs;
  var isCheckedPersonal = false.obs;

  void changeOption1() {
    isVisible1.value = !isVisible1.value;
  }

  void changeOption2() {
    isVisible2.value = !isVisible2.value;
  }

  void changePersonal() {
    isCheckedPersonal.value = !isCheckedPersonal.value;
  }

  void changeAgreement() {
    isCheckedAgreement.value = !isCheckedAgreement.value;
  }

  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) return 'Email can not be empty';
    String pattern = r'\w+@\w+\.\w+';
    RegExp reg = RegExp(pattern);
    if (!reg.hasMatch(email)) {
      return 'Invalid email format';
    }
    return null;
  }

  String? validateText(String? field) {
    if (field == null || field.isEmpty) {
      return 'Field can not be empty';
    }
    return null;
  }

  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password cannot be empty';
    }
    if (password.length < 8) {
      return "Password is too short";
    }
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp reg = RegExp(pattern);
    if (!reg.hasMatch(password)) {
      return 'Invalid Password Format';
    }
    return null;
  }

  void registerNewUser({
    required String email,
    required String password,
    required String fullName,
    required String location,
    required String contact,
  }) {
    String message = AuthController.instance.createNewAccount(
      email: email,
      password: password,
      fullName: fullName,
      location: location,
      contact: contact,
    ) as String;
    if (message != 'success') {
      Get.snackbar('Failed Attempt', message);
    }
  }

  Future<void> verifyEmail() async {
    String message = await AuthController.instance.sendEmailVerification();
    if (message != 'success') {
      Get.snackbar('Failed Attempt', message);
    }
  }

  String? checkPassword(String? pass, String? pass1) {
    if (pass != pass1) {
      return 'Passwords do not match';
    }
    return null;
  }
}
