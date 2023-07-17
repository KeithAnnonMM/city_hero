import 'dart:io';

import 'package:city_hero/models/user_model.dart';
import 'package:city_hero/screens/home/profile/profile_controller.dart';
import 'package:city_hero/widgets/reusable_submit_button.dart';
import 'package:city_hero/widgets/textwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Color(0xFF16104a),
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.arrow_back, color: Colors.white)),
        title: Row(
          children: [
            Text(
              'My Profile',
              style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          FutureBuilder(
            future: controller.data,
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  UserModel userModel = snapshot.data as UserModel;
                  controller.nameTemp.value = userModel.fullName.toString();
                  controller.profilePath.value = userModel.imagePath.toString();
                  controller.profileName.value = userModel.fullName.toString();
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.center,
                        children: [
                          userCoverPhoto(controller),
                          Positioned(
                            top: 100,
                            child:
                                userProfilePic(controller, context, userModel),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 5,
                            child: IconButton(
                              icon: Icon(Icons.edit,
                                  size: 20, color: Colors.white),
                              onPressed: () {
                                Get.bottomSheet(Container(
                                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                                  color: Colors.grey,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          controller
                                              .pickImage(ImageSource.gallery);
                                        },
                                        child: Icon(
                                          Icons.photo,
                                          size: 40,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 100,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          controller
                                              .pickImage(ImageSource.camera);
                                        },
                                        child: Icon(
                                          Icons.camera_alt,
                                          size: 40,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ));
                              },
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 80),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 20, 30, 5),
                        child: Column(
                          children: [
                            userModel.about == ''
                                ? controller.bioTemp == ''
                                    ? InkWell(
                                        onTap: () {
                                          Get.bottomSheet(Container(
                                            height: (MediaQuery.of(context)
                                                    .size
                                                    .height) /
                                                4,
                                            padding: EdgeInsets.fromLTRB(
                                                20, 20, 20, 20),
                                            decoration: BoxDecoration(
                                              color: Colors.grey,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Column(
                                              children: [
                                                TextWidget(
                                                  size: 15,
                                                  text: 'Add Bio',
                                                  bold: true,
                                                ),
                                                const SizedBox(height: 10),
                                                TextField(
                                                  controller:
                                                      controller.bioText,
                                                  decoration: InputDecoration(
                                                    hintText:
                                                        "Your Text Goes here",
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Colors.white,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Colors.white,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(height: 10),
                                                SubmitButton(
                                                    text: 'Save',
                                                    ontap: () {
                                                      controller.bioTemp.value =
                                                          controller
                                                              .bioText.text;
                                                      controller.pushBioToDb(
                                                          userModel,
                                                          controller
                                                              .bioText.text);
                                                    })
                                              ],
                                            ),
                                          ));
                                        },
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 80.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.add,
                                                color: Colors.blue,
                                                size: 14,
                                              ),
                                              TextWidget(
                                                size: 14,
                                                text: 'Add Bio',
                                                bold: false,
                                                color: Colors.blue,
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    : Row(
                                        children: [
                                          Icon(Icons.cases_outlined, size: 20),
                                          const SizedBox(width: 40),
                                          Obx(() => Flexible(
                                                child: TextWidget(
                                                  size: 14,
                                                  text:
                                                      '${controller.bioTemp.value}',
                                                  bold: false,
                                                ),
                                              )),
                                          const SizedBox(width: 10),
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.edit, size: 15),
                                          ),
                                        ],
                                      )
                                : Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.cases_outlined, size: 20),
                                      const SizedBox(width: 40),
                                      Flexible(
                                        child: TextWidget(
                                          size: 14,
                                          text: '${userModel.about}',
                                          bold: false,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      IconButton(
                                        onPressed: () {
                                          Get.bottomSheet(Container(
                                            height: (MediaQuery.of(context)
                                                    .size
                                                    .height) /
                                                4,
                                            padding: EdgeInsets.fromLTRB(
                                                20, 20, 20, 20),
                                            decoration: BoxDecoration(
                                              color: Colors.grey,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Column(
                                              children: [
                                                TextWidget(
                                                  size: 15,
                                                  text: 'Add Bio',
                                                  bold: true,
                                                ),
                                                const SizedBox(height: 10),
                                                TextField(
                                                  controller:
                                                      controller.bioText,
                                                  decoration: InputDecoration(
                                                    hintText:
                                                        "Your Text Goes here",
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Colors.white,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Colors.white,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(height: 10),
                                                SubmitButton(
                                                    text: 'Save',
                                                    ontap: () {
                                                      controller.bioTemp.value =
                                                          controller
                                                              .bioText.text;
                                                      controller.pushBioToDb(
                                                          userModel,
                                                          controller
                                                              .bioText.text);
                                                      controller.bioText
                                                          .clear();
                                                    })
                                              ],
                                            ),
                                          ));
                                        },
                                        icon: Icon(Icons.edit, size: 15),
                                      ),
                                    ],
                                  ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Icon(Icons.person, size: 20),
                                const SizedBox(width: 40),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Obx(() => TextWidget(
                                          size: 14,
                                          text: '${controller.nameTemp.value}',
                                          bold: true,
                                        )),
                                    TextWidget(
                                      size: 12,
                                      text: '${controller.user.email}',
                                      bold: false,
                                    ),
                                  ],
                                ),
                                Expanded(child: Container()),
                                const SizedBox(width: 10),
                                IconButton(
                                  onPressed: () {
                                    Get.bottomSheet(Container(
                                      height:
                                          (MediaQuery.of(context).size.height) /
                                              4,
                                      padding:
                                          EdgeInsets.fromLTRB(20, 20, 20, 20),
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Column(
                                        children: [
                                          TextWidget(
                                            size: 15,
                                            text: 'Edit Full Name',
                                            bold: true,
                                          ),
                                          const SizedBox(height: 10),
                                          TextField(
                                            controller: controller.nameText,
                                            decoration: InputDecoration(
                                              hintText: "Your Fullname",
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.white,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.white,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          SubmitButton(
                                            text: 'Save',
                                            ontap: () {
                                              if (controller
                                                      .nameText.text.length >
                                                  25) {
                                                Get.snackbar('Error',
                                                    'Name is too long');
                                              } else {
                                                controller.nameTemp.value =
                                                    controller.nameText.text;
                                                controller.pushNameToDb(
                                                    userModel,
                                                    controller.nameText.text);
                                                controller.nameText.clear();
                                                controller.profileName.value =
                                                    controller.nameText.text;
                                              }
                                            },
                                          )
                                        ],
                                      ),
                                    ));
                                  },
                                  icon: Icon(Icons.edit, size: 15),
                                ),
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
                                Expanded(child: Container()),
                                const SizedBox(width: 10),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.edit, size: 15),
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
                                Expanded(child: Container()),
                                const SizedBox(width: 10),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.edit, size: 15),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 0, right: 50),
                              child: SubmitButton(
                                  text: 'Save Changes',
                                  ontap: () {
                                    controller.pushImageToDb(userModel);
                                    controller.resetIsSelected();
                                  }),
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                }
              }
              return const LinearProgressIndicator();
            }),
          )
        ],
      ),
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

  userProfilePic(
          ProfileController controller, BuildContext context, UserModel user) =>
      Obx(
        () => controller.selectedImagePath != ''
            ? CircleAvatar(
                backgroundImage: FileImage(
                  File(controller.selectedImagePath.value),
                ),
                radius: 80,
              )
            : controller.selectedImagePath == ''
                ? user.imagePath == ''
                    ? EmptyAvator(controller: controller)
                    : CircleAvatar(
                        backgroundImage:
                            NetworkImage(user.imagePath.toString()),
                        radius: 80,
                      )
                : EmptyAvator(controller: controller),
      );
}

// ignore: must_be_immutable
class EmptyAvator extends StatelessWidget {
  EmptyAvator({super.key, required this.controller});
  ProfileController controller;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      child: InkWell(
        onTap: () {
          Get.bottomSheet(Container(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
            color: Colors.grey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    controller.pickImage(ImageSource.gallery);
                  },
                  child: Icon(
                    Icons.photo,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 100,
                ),
                InkWell(
                  onTap: () {
                    controller.pickImage(ImageSource.camera);
                  },
                  child: Icon(
                    Icons.camera_alt,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ));
        },
        child: Icon(
          Icons.add_a_photo,
          size: 45,
          color: Colors.black,
        ),
      ),
      radius: 80,
    );
  }
}
