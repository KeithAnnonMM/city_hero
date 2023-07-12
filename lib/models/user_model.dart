import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? imagePath;
  String? about;
  String? fullName;
  String? contact;
  String? location;
  String? email;

  UserModel(
      {this.fullName,
      this.contact,
      this.location,
      this.email,
      this.about,
      this.imagePath});

  UserModel.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    about = json['about'];
    imagePath = json['imagePath'];
    contact = json['contact'];
    location = json['location'];
    email = json['email'];
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
      about: data['about'],
      imagePath: data['imagePath'],
      contact: data['contact'],
      fullName: data['fullName'],
      location: data['location'],
      email: data['email'],
    );
  }
}
