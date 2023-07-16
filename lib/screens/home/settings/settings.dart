import 'package:city_hero/screens/home/settings/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingsController());
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.arrow_back, color: Colors.black)),
        title: Row(
          children: [
            Text(
              'SETTINGS',
              style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Expanded(
              child: Container(),
            ),
            IconButton(
                onPressed: () {
                  Get.defaultDialog(
                      title: 'Logout',
                      middleText: 'Are you sure?',
                      textCancel: 'Cancel',
                      confirmTextColor: Colors.white,
                      textConfirm: 'Yes',
                      onConfirm: () => controller.signOutUser());
                },
                icon: Icon(
                  Icons.outbox_outlined,
                  color: Colors.black,
                ))
          ],
        ),
      ),
    );
  }
}
