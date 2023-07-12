import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:city_hero/screens/mailVerification/mail_verification_controller.dart';
import 'package:city_hero/widgets/reusable_submit_button.dart';

class MailVerification extends StatelessWidget {
  const MailVerification({super.key, required this.email});
  final String? email;

  @override
  Widget build(BuildContext context) {
    final VerificationController controller = Get.put(VerificationController());
    return Scaffold(
        body: ListView(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/real.png',
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
                  Icons.email_outlined,
                  size: 120,
                ),
                Text(
                  'Verify your Email Address',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'We have sent verification procedure to your email $email. Please check your mailbox to complete your verification process in order to continue.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(fontSize: 14),
                ),
                const SizedBox(height: 10),
                Text(
                  'If not automatically redirected after verification, click on the continue button below',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(fontSize: 14),
                ),
                const SizedBox(height: 30),
                SubmitButton(
                    text: 'CONTINUE',
                    ontap: () {
                      controller.manuallyCheckEmailVerificationStatus();
                    }),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Resend E-mail Link',
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
