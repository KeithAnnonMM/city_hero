import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

CollectionReference users = FirebaseFirestore.instance.collection('users');

Future<void> addUserInfo({
  required String fullName,
  required String contact,
  required String location,
  required String email,
}) {
  return users
      .add({
        'fullName': fullName,
        'contact': contact,
        'location': location,
        'email': email,
        'about': "",
        'imagePath': "",
      })
      .then((value) => Get.snackbar('Success', 'Added Successfully'))
      .catchError(
          (error) => Get.snackbar('Error', "Failed to add user: $error"));
}

Future<void> getUserInfo() {
  return users.get();
}
