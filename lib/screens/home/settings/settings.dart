import 'package:city_hero/screens/home/settings/settings_controller.dart';
import 'package:city_hero/widgets/reusable_submit_button.dart';
import 'package:city_hero/widgets/textwidget.dart';
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
            Expanded(
              child: Container(),
            ),
            IconButton(
                onPressed: () {
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
                        const SizedBox(height: 20),
                        SubmitButton(
                            text: 'CONTINUE',
                            ontap: () {
                              controller.signOutUser();
                            }),
                      ],
                    ),
                  ));
                },
                icon: Icon(
                  Icons.outbox_outlined,
                  color: Colors.white,
                ))
          ],
        ),
      ),
    );
  }
}
