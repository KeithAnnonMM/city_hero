import 'package:city_hero/screens/resetPassword/password_reset_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/reusable_submit_button.dart';

class PasswordReset extends StatelessWidget {
  const PasswordReset({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    final PasswordResetController controller =
        Get.put(PasswordResetController());
    controller.email = email;
    return Scaffold(
        body: ListView(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/logo.png',
              ),
              opacity: 0.04,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.key_off_outlined,
                  size: 120,
                ),
                Text(
                  'FORGOT PASSWORD?',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'A password reset procedure will be sent to your email $email. Press Continue to complete your reset process in order to continue.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(fontSize: 14),
                ),
                const SizedBox(height: 20),
                SubmitButton(
                  text: 'CONTINUE',
                  ontap: () {
                    controller.resetPassword();
                  },
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Text(
                    'Return to Login',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
