import 'package:ecommerce_app/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/helpers/my_string.dart';
import '../../../../core/theme.dart';
import '../../../../core/utils/custom_button.dart';
import '../../../../core/utils/text_utils.dart';
import '../../logic/controller/auth_controller.dart';
import '../widgets/custom_bottom_container.dart';
import '../widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: CustomBottomContainer(
        text2: 'Sign up',
        text: 'Don\'t have an Account ?',
        onPressed: () {
          Get.offNamed(Routs.signUpScreen);
        },
      ),
      backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
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
                        text: 'LOG',
                        fontSize: 28,
                        color: mainColor,
                        fontWeight: FontWeight.w500),
                    SizedBox(
                      width: 4,
                    ),
                    TextUtils(
                        text: 'IN',
                        fontSize: 28,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w500),
                  ],
                ),
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
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
                      height: 20,
                    ),
                    GetBuilder<AuthController>(builder: (_) {
                      return CustomTextField(
                        suffixIcon: IconButton(
                            onPressed: () {
                              controller.visability();
                            },
                            icon: controller.isVisible
                                ? Icon(
                                    Icons.visibility,
                                    color: Colors.black,
                                  )
                                : Icon(Icons.visibility_off,
                                    color: Colors.black)),
                        hintText: 'Password',
                        controller: password,
                        validator: (value) {
                          if (value.toString().length < 6) {
                            return 'Short Password';
                          } else {
                            return null;
                          }
                        },
                        prefixIcon: Image.asset('assets/images/lock.png'),
                        obscureText: controller.isVisible ? false : true,
                      );
                    }),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    Get.toNamed(Routs.forgetPassScreen);
                  },
                  child: TextUtils(
                      text: 'Forget Password ?',
                      fontSize: 16,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontWeight: FontWeight.normal),
                ),
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
                    text: 'Login',
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              TextUtils(
                  text: 'OR',
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.normal),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(child: Image.asset('assets/images/facebook.png')),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(child: Image.asset('assets/images/google.png')),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
