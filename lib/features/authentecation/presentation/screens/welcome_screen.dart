import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/routing/app_router.dart';
import '../../../../core/theme.dart';
import '../../../../core/utils/custom_button.dart';
import '../../../../core/utils/custom_welcom_container.dart';
import '../../../../core/utils/text_utils.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                'assets/images/background.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: Colors.black.withValues(alpha: 0.2),
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomWelcomeContainer(
                    child: Center(
                      child: TextUtils(
                        text: 'Welcome',
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomWelcomeContainer(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextUtils(
                          text: 'Asroo ',
                          fontSize: 20,
                          color: mainColor,
                          fontWeight: FontWeight.bold),
                      TextUtils(
                          text: 'Shop',
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ],
                  )),
                  SizedBox(
                    height: 150,
                  ),
                  CustomButton(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    onPressed: () {
                      Get.offNamed(Routs.loginScreen);
                    },
                    child: TextUtils(
                        text: 'Get Start',
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextUtils(
                          text: 'Don\'t have an Account ? ',
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.normal),
                      InkWell(
                        onTap: () {
                          Get.offNamed(Routs.signUpScreen);
                        },
                        child: TextUtils(
                          text: 'SignUp',
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
