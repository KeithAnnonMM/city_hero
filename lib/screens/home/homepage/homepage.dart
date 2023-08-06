import 'package:city_hero/models/article_model.dart';
import 'package:city_hero/models/user_model.dart';
import 'package:city_hero/screens/home/alerts/details/alerts.dart';
import 'package:city_hero/screens/home/mapview/map.dart';
import 'package:city_hero/screens/home/homepage/home_controller.dart';
import 'package:city_hero/screens/home/safetytips/safety_tips.dart';
import 'package:city_hero/screens/home/settings/settings.dart';
import 'package:city_hero/screens/home/profile/profile.dart';
import 'package:city_hero/screens/home/support/support.dart';
import 'package:city_hero/screens/home/terms/terms.dart';
import 'package:city_hero/services/api_services.dart';
import 'package:city_hero/widgets/textwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../database/firebase_constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    final body_controller = Get.put(ApiServices());
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
      body: FutureBuilder(
          future: body_controller.getArticle(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                List<Article>? articles = snapshot.data;
                return ListView.builder(
                  itemCount: articles!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[200],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image(
                              image: NetworkImage(
                                articles[index].urlToImage.toString(),
                              ),
                            ),
                            TextWidget(
                              size: 14,
                              text: articles[index].title.toString(),
                              bold: true,
                            ),
                            TextWidget(
                                size: 13,
                                text: articles[index].content.toString(),
                                bold: false)
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            }
            return Center(
              child: LottieBuilder.asset('assets/loading.json'),
            );
          }),
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

  MyHeader(HomeController controller) => FutureBuilder(
      future: controller.data,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            UserModel dataFile = snapshot.data as UserModel;
            return Container(
              height: 200,
              width: double.infinity,
              color: Color(0xFF16104a),
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    dataFile.imagePath != ''
                        ? CircleAvatar(
                            backgroundImage:
                                NetworkImage(dataFile.imagePath.toString()),
                            radius: 50,
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
                    TextWidget(
                        size: 15,
                        text: '${dataFile.fullName}',
                        bold: true,
                        color: Colors.white),
                  ],
                ),
              ),
            );
          }
        }
        return Container(
            height: 200,
            width: double.infinity,
            color: Color(0xFF16104a),
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
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
                ],
              ),
            ));
      });

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
