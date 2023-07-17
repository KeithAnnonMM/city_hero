import 'package:city_hero/screens/home/alerts/details/alerts.dart';
import 'package:city_hero/screens/home/mapview/map.dart';
import 'package:city_hero/screens/home/profile/profile_controller.dart';
import 'package:city_hero/screens/home/safetytips/safety_tips.dart';
import 'package:city_hero/screens/home/settings/settings.dart';
import 'package:city_hero/screens/home/profile/profile.dart';
import 'package:city_hero/screens/home/support/support.dart';
import 'package:city_hero/screens/home/terms/terms.dart';
import 'package:city_hero/widgets/textwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../../database/firebase_constants.dart';
import '../../../widgets/home_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Color(0xFF16104a),
        title: Row(
          children: [
            Expanded(
              child: Container(),
            ),
            Text(
              'HOME',
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
                  Get.to(() => Settings());
                },
                icon: Icon(
                  Icons.settings,
                  color: Colors.white,
                ))
          ],
        ),
      ),
      body: Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: [
                HomeItem(
                    icon: Icon(
                      Icons.notification_important,
                      size: 40,
                      color: Colors.red,
                    ),
                    text: 'Alerts',
                    function: () {},
                    color: Colors.red),
                HomeItem(
                  icon: Icon(
                    Icons.location_history,
                    size: 40,
                    color: Colors.green,
                  ),
                  text: 'Map',
                  function: () {},
                  color: Colors.green,
                ),
                HomeItem(
                  icon: Icon(
                    Icons.handshake_rounded,
                    size: 40,
                    color: Colors.black,
                  ),
                  text: 'Support',
                  function: () {},
                  color: Colors.black,
                ),
                HomeItem(
                  icon: Icon(
                    Icons.person,
                    size: 40,
                    color: Color.fromARGB(255, 4, 13, 34),
                  ),
                  text: 'Profile',
                  function: () {
                    Get.to(() => Profile());
                  },
                  color: Color.fromARGB(255, 4, 13, 34),
                ),
                HomeItem(
                  icon: Icon(
                    Icons.safety_check,
                    size: 40,
                    color: Colors.brown,
                  ),
                  text: 'Safety Tips',
                  function: () {},
                  color: Colors.brown,
                ),
                HomeItem(
                  icon: Icon(
                    Icons.settings,
                    size: 40,
                    color: Colors.purple,
                  ),
                  text: 'Settings',
                  function: () {
                    Get.to(() => Settings());
                  },
                  color: Colors.purple,
                ),
              ])),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeader(controller),
                MyDrawerList(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  MyHeader(ProfileController controller) => Container(
        height: 200,
        width: double.infinity,
        color: Color(0xFF16104a),
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              controller.profilePath.value != ''
                  ? Obx(
                      () => CircleAvatar(
                        backgroundImage: NetworkImage(
                            controller.profilePath.value.toString()),
                        radius: 50,
                      ),
                    )
                  : CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Icon(
                        Icons.person,
                        size: 55,
                        color: Colors.white,
                      ),
                      radius: 50,
                    ),
              const SizedBox(height: 20),
              TextWidget(
                  size: 12,
                  text: '${auth.currentUser!.email}',
                  bold: false,
                  color: Colors.white),
              Obx(() => TextWidget(
                  size: 15,
                  text: '${controller.profileName.value}',
                  bold: true,
                  color: Colors.white))
            ],
          ),
        ),
      );

  MyDrawerList(context) => Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Column(
            children: [
              DrawerItem(Icons.home, 'News Feeds', () {
                Navigator.pop(context);
                Get.to(() => HomePage());
              }),
              DrawerItem(Icons.notification_important_rounded, 'Alerts', () {
                Navigator.pop(context);
                Get.to(() => Alerts());
              }),
              DrawerItem(Icons.map, 'Map', () {
                Navigator.pop(context);
                Get.to(() => MapViews());
              }),
              DrawerItem(Icons.support, 'Support', () {
                Navigator.pop(context);
                Get.to(() => Support());
              }),
              DrawerItem(Icons.person, 'Profile', () {
                Navigator.pop(context);
                Get.to(() => Profile());
              }),
              DrawerItem(Icons.chair_rounded, 'Terms and Policies', () {
                Navigator.pop(context);
                Get.to(() => Terms());
              }),
              DrawerItem(Icons.safety_check, 'Safety Tips', () {
                Navigator.pop(context);
                Get.to(() => SafetyTips());
              }),
              DrawerItem(Icons.settings, 'Settings', () {
                Navigator.pop(context);
                Get.to(() => Settings());
              }),
            ],
          ),
        ),
      );

  Widget DrawerItem(IconData icon, String text, VoidCallback onTap) => Material(
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                  child: Icon(
                    icon,
                    size: 20,
                    color: Color(
                      0xFF16104a,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: TextWidget(
                    size: 17,
                    text: text,
                    bold: false,
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
