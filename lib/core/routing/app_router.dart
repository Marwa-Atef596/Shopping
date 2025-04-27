import 'package:ecommerce_app/features/authentecation/presentation/screens/login_screen.dart';
import 'package:ecommerce_app/features/authentecation/presentation/screens/sign_up_screen.dart';
import 'package:ecommerce_app/features/authentecation/presentation/screens/welcome_screen.dart';
import 'package:get/get.dart';

class AppRouter {
  //initial
  static const welcome = Routs.welcomeScreen;

  static final routes = [
    GetPage(
      name: Routs.welcomeScreen,
      page: () => WelcomeScreen(),
    ),
    GetPage(
      name: Routs.welcomeScreen,
      page: () => WelcomeScreen(),
    ),
    GetPage(
      name: Routs.loginScreen,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: Routs.signUpScreen,
      page: () => SignUpScreen(),
    ),
  ];
}

class Routs {
  static const welcomeScreen = '/welcomeScreen';
  static const loginScreen = '/loginScreen';
  static const signUpScreen = '/signUpScreen';
}
