import 'package:city_hero/screens/home/settings/settings.dart';
import 'package:city_hero/screens/home/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../widgets/home_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            const SizedBox(width: 30),
            Text(
              'HOME',
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
                  Get.to(() => Settings());
                },
                icon: Icon(
                  Icons.settings,
                  color: Colors.black,
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
      bottomNavigationBar: GNav(
        hoverColor: Colors.grey,
        curve: Curves.easeOutExpo,
        duration: Duration(milliseconds: 600),
        gap: 8,
        color: Colors.grey[800],
        activeColor: Color.fromARGB(255, 180, 91, 91),
        iconSize: 27,
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        tabs: [
          GButton(icon: Icons.home, text: 'Home'),
          GButton(icon: Icons.search, text: 'Search'),
          GButton(icon: Icons.person_2, text: 'Profile'),
        ],
      ),
    );
  }
}
