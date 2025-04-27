import 'package:ecommerce_app/core/utils/custom_button.dart';
import 'package:ecommerce_app/core/utils/text_utils.dart';
import 'package:ecommerce_app/features/authentecation/presentation/widgets/custom_bottom_container.dart';
import 'package:ecommerce_app/features/authentecation/presentation/widgets/custom_check_box.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_text_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: CustomBottomContainer(
        text2: 'Login',
        text: 'Already have an Account ?',
        onPressed: () {},
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * .2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextUtils(
                        text: 'SIGN',
                        fontSize: 28,
                        color: Colors.greenAccent,
                        fontWeight: FontWeight.w500),
                    SizedBox(
                      width: 4,
                    ),
                    TextUtils(
                        text: 'UP',
                        fontSize: 28,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                  ],
                ),
              ),
              CustomTextField(
                hintText: 'User Name',
                controller: name,
                validator: (p0) {
                  return null;
                },
                prefixIcon: Image.asset('assets/images/user.png'),
                obscureText: false,
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                hintText: 'Email',
                controller: email,
                validator: (p0) {
                  return null;
                },
                prefixIcon: Image.asset('assets/images/email.png'),
                obscureText: false,
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                hintText: 'Password',
                controller: password,
                validator: (p0) {
                  return null;
                },
                prefixIcon: Image.asset('assets/images/lock.png'),
                obscureText: true,
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  CustomCheckBox(),
                  SizedBox(
                    width: 10,
                  ),
                  TextUtils(
                      text: 'I accept',
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.normal),
                  SizedBox(
                    width: 4,
                  ),
                  TextUtils(
                    text: 'terms & conditions',
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.black,
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              CustomButton(
                onPressed: () {},
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.height * .18,
                    vertical: 12),
                child: TextUtils(
                    text: 'Sign Up',
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
