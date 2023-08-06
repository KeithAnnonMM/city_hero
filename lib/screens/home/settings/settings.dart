import 'package:city_hero/screens/home/profile/profile.dart';
import 'package:city_hero/screens/home/settings/settings_controller.dart';
import 'package:city_hero/widgets/reusable_submit_button.dart';
import 'package:city_hero/widgets/textwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
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
        backgroundColor: Color(0xFF16104a),
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.arrow_back, color: Colors.white)),
        title: Row(
          children: [
            Text(
              'SETTINGS',
              style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SettingsGroup(title: 'General', children: [
            SimpleSettingsTile(
              title: 'Account Details',
              subtitle: 'Privacy, Security, Location',
              leading: Icon(
                Icons.person,
                color: Color(0xFF16104a),
              ),
              onTap: () {
                Get.to(() => Profile());
              },
            ),
          ]),
          SettingsGroup(
            title: 'Feedback',
            children: [
              SimpleSettingsTile(
                title: 'Bug Reports',
                leading: Icon(
                  Icons.bug_report,
                  color: Colors.red,
                ),
                onTap: () {
                  Get.snackbar(
                    'PENDING',
                    'Feature Still under development',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                },
              ),
              SimpleSettingsTile(
                title: 'User Feedback',
                leading: Icon(
                  Icons.thumbs_up_down,
                  color: Colors.blue,
                ),
                onTap: () {
                  Get.snackbar(
                    'PENDING',
                    'Feature Still under development',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                },
              )
            ],
          ),
          const SizedBox(height: 20),
          SimpleSettingsTile(
            title: 'LogOut',
            leading: Icon(
              Icons.logout,
              color: Colors.blue,
            ),
            onTap: () {
              Get.bottomSheet(Container(
                height: (MediaQuery.of(context).size.height) / 6,
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    TextWidget(
                      size: 15,
                      text: 'LOG OUT',
                      bold: true,
                    ),
                    SubmitButton(
                        text: 'CONTINUE',
                        ontap: () {
                          controller.signOutUser();
                        }),
                  ],
                ),
              ));
            },
          )
        ],
      ),
    );
  }
}
