import 'package:ecommerce_app/core/utils/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/helpers/my_string.dart';
import '../../../../core/utils/custom_button.dart';
import '../widgets/custom_text_field.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});
  final TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextUtils(
                  textAlign: TextAlign.center,
                  text:
                      'if you want to recover your account , then please provide your email ID below...',
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
              SizedBox(
                height: 50,
              ),
              Image.asset(
                'assets/images/forgetpass copy.png',
                width: 290,
              ),
              SizedBox(
                height: 50,
              ),
              CustomTextField(
                hintText: 'Email',
                controller: email,
                validator: (value) {
                  if (!RegExp(validationEmail).hasMatch(value!)) {
                    return 'Invalid Email';
                  } else {
                    return null;
                  }
                },
                prefixIcon: Image.asset('assets/images/email.png'),
                obscureText: false,
              ),
              SizedBox(
                height: 30,
              ),
              CustomButton(
                onPressed: () {},
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * .42,
                    vertical: 12),
                child: TextUtils(
                    text: 'Send',
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
