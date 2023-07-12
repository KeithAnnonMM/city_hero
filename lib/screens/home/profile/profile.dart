import 'package:city_hero/models/user_model.dart';
import 'package:city_hero/screens/home/profile/profile_controller.dart';
import 'package:city_hero/widgets/textwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.arrow_back, color: Colors.black)),
        title: Row(
          children: [
            Text(
              'My Profile',
              style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          UpperProfile(controller, context),
          const SizedBox(height: 80),
          Padding(
            padding: const EdgeInsets.fromLTRB(70, 50, 20, 10),
            child: FutureBuilder(
              future: controller.data,
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    UserModel userModel = snapshot.data as UserModel;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.person, size: 20),
                            const SizedBox(width: 40),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(
                                  size: 14,
                                  text: '${userModel.fullName}',
                                  bold: true,
                                ),
                                TextWidget(
                                  size: 12,
                                  text: '${controller.user.email}',
                                  bold: false,
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(Icons.home, size: 20),
                            const SizedBox(width: 40),
                            TextWidget(
                              size: 14,
                              text: '${userModel.location}',
                              bold: false,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(Icons.phone, size: 20),
                            const SizedBox(width: 40),
                            TextWidget(
                              size: 14,
                              text: '${userModel.contact}',
                              bold: false,
                            ),
                          ],
                        ),
                      ],
                    );
                  }
                }
                return const CircularProgressIndicator();
              }),
            ),
          )
        ],
      ),
    );
  }

  Stack UpperProfile(ProfileController controller, BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        userCoverPhoto(controller),
        Positioned(
          top: 100,
          child: userProfilePic(controller, context),
        ),
        Positioned(
          bottom: 0,
          right: 5,
          child: IconButton(
            icon: Icon(Icons.edit, size: 20, color: Colors.white),
            onPressed: () {},
          ),
        )
      ],
    );
  }

  userCoverPhoto(ProfileController controller) => Container(
        color: Colors.grey,
        child: Image.network(
          'https://picsum.photos/200/300/?blur',
          height: 180,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      );

  userProfilePic(ProfileController controller, BuildContext context) =>
      CircleAvatar(
        backgroundImage: AssetImage('assets/profile.JPG'),
        minRadius: 80,
      );

  Widget bottomSheet(BuildContext context) => Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            TextWidget(size: 15, text: 'Choose Profile Picture', bold: false),
          ],
        ),
      );
}
