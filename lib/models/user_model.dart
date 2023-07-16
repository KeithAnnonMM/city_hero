import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String? imagePath;
  String? about;
  String? fullName;
  String? contact;
  String? location;
  String? email;

  UserModel({
    this.fullName,
    this.contact,
    this.location,
    this.email,
    this.about,
    this.imagePath,
    this.id,
  });

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
      id: document.id,
      about: data['about'],
      imagePath: data['imagePath'],
      contact: data['contact'],
      fullName: data['fullName'],
      location: data['location'],
      email: data['email'],
    );
  }

  toJson() {
    return {
      "fullName": fullName,
      "contact": contact,
      "location": location,
      "email": email,
      "imagePath": imagePath,
      "about": about,
    };
  }
}
