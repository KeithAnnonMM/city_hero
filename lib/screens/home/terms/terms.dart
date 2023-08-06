import 'package:city_hero/screens/home/terms/terms_controller.dart';
import 'package:city_hero/widgets/textwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Terms extends StatelessWidget {
  const Terms({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TermsController());
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
              'Terms And Policies',
              style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.article_outlined,
                    size: 45,
                    color: Color(0xFF16104a),
                  ),
                  const SizedBox(width: 20),
                  TextWidget(
                      size: 15, text: 'Last Updated: July, 2023', bold: true),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                margin: EdgeInsets.all(8),
                child:
                    TextWidget(size: 13, text: controller.terms, bold: false),
              )
            ],
          ),
        ),
      ),
    );
  }
}
