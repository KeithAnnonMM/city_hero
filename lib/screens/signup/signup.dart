import 'package:city_hero/screens/signup/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/emailfield.dart';
import '../../widgets/reusable_submit_button.dart';
import '../../widgets/textwidget.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});
  static final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final SignUpController mainController = Get.put(SignUpController());
    String selected = mainController.areas[0];

    List<String> countries = mainController.areas;
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/logo.png'), opacity: 0.04),
            ),
            child: Padding(
              padding: const EdgeInsets.all(35.0),
              child: Column(
                children: [
                  Form(
                    key: formkey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'SIGNUP',
                              style: GoogleFonts.poppins(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        CustomTextFormField(
                          controller: mainController.fullNameController,
                          validate: mainController.validateText,
                          text: 'Full Name',
                          isPassword: false,
                        ),
                        CustomTextFormField(
                          controller: mainController.contactController,
                          validate: mainController.validateText,
                          text: 'Contact',
                          isPassword: false,
                        ),
                        DropdownButtonFormField(
                          value: selected,
                          items: countries.map((area) {
                            return DropdownMenuItem(
                              value: area,
                              child: Text(area),
                            );
                          }).toList(),
                          onChanged: (selectedArea) {
                            selected = selectedArea.toString();
                          },
                          decoration: const InputDecoration(
                            labelText: 'Area',
                            hintText: 'Select your Area of Residence',
                          ),
                        ),
                        CustomTextFormField(
                          validate: mainController.validateEmail,
                          controller: mainController.emailController,
                          text: 'Email Address',
                          isPassword: false,
                        ),
                        Obx(
                          () => TextFormField(
                            validator: mainController.validatePassword,
                            controller: mainController.passwordController,
                            obscureText: mainController.isVisible1.value,
                            decoration: InputDecoration(
                                label: Text('Password',
                                    style: GoogleFonts.poppins(fontSize: 14)),
                                hintStyle: const TextStyle(color: Colors.grey),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 0),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                suffixIcon: IconButton(
                                    onPressed: () =>
                                        mainController.changeOption1(),
                                    icon: mainController.isVisible1.value ==
                                            true
                                        ? const Icon(Icons.visibility)
                                        : const Icon(Icons.visibility_off))),
                            textInputAction: TextInputAction.next,
                            textCapitalization: TextCapitalization.none,
                            autocorrect: false,
                          ),
                        ),
                        Obx(
                          () => TextFormField(
                            validator: mainController.validatePassword,
                            controller:
                                mainController.confirmPasswordController,
                            obscureText: mainController.isVisible2.value,
                            decoration: InputDecoration(
                                label: Text('Confirm Password',
                                    style: GoogleFonts.poppins(fontSize: 14)),
                                hintStyle: const TextStyle(color: Colors.grey),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 0),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                suffixIcon: IconButton(
                                    onPressed: () =>
                                        mainController.changeOption2(),
                                    icon: mainController.isVisible2.value ==
                                            true
                                        ? const Icon(Icons.visibility)
                                        : const Icon(Icons.visibility_off))),
                            textInputAction: TextInputAction.next,
                            textCapitalization: TextCapitalization.none,
                            autocorrect: false,
                          ),
                        ),
                        const TextWidget(
                          text:
                              'Password must be atleast 8 characters long and include 1 capital letter and 1 symbol',
                          size: 12,
                          bold: false,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Obx(
                              () => Checkbox(
                                  fillColor:
                                      MaterialStateProperty.all(Colors.black),
                                  value:
                                      mainController.isCheckedAgreement.value,
                                  onChanged: (value) =>
                                      mainController.changeAgreement()),
                            ),
                            Text(
                              'I agree to the Terms and Privacy Policy',
                              style: GoogleFonts.poppins(fontSize: 14),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Obx(
                              () => Checkbox(
                                  fillColor:
                                      MaterialStateProperty.all(Colors.black),
                                  value: mainController.isCheckedPersonal.value,
                                  onChanged: (value) =>
                                      mainController.changePersonal()),
                            ),
                            Text(
                              'Please use my personal information for any\nadvertisements',
                              style: GoogleFonts.poppins(fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        SubmitButton(
                            text: 'CREATE ACCOUNT',
                            ontap: () {
                              if (formkey.currentState!.validate()) {
                                if (mainController
                                        .confirmPasswordController.text !=
                                    mainController.passwordController.text) {
                                  Get.bottomSheet(Container(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 20, 20, 20),
                                      color: Colors.grey,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              mainController.passwordController
                                                  .clear();
                                              mainController
                                                  .confirmPasswordController
                                                  .clear();
                                            },
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.error,
                                                  size: 40,
                                                  color: Colors.white,
                                                ),
                                                const SizedBox(width: 10),
                                                TextWidget(
                                                  size: 15,
                                                  text:
                                                      "Passwords Do not match",
                                                  bold: false,
                                                  color: Colors.white,
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      )));
                                } else {
                                  if (mainController.isCheckedAgreement.value) {
                                    mainController.registerNewUser(
                                        email:
                                            mainController.emailController.text,
                                        password: mainController
                                            .passwordController.text,
                                        fullName: mainController
                                            .fullNameController.text,
                                        contact: mainController
                                            .contactController.text,
                                        location: selected);
                                  } else {
                                    Get.snackbar('AGREEMENT',
                                        'Agree to the Terms and Privacy Policy to continue');
                                  }
                                }
                              }
                            }),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const TextWidget(
                                size: 13,
                                text: 'Already Have Account?',
                                bold: false),
                            const SizedBox(width: 5),
                            GestureDetector(
                              onTap: () => Get.back(),
                              child: Text(
                                'Login',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
