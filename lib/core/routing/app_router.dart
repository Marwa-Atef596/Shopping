import 'package:ecommerce_app/features/authentecation/logic/binding/auth_bindiing.dart';
import 'package:ecommerce_app/features/authentecation/presentation/screens/forget_password_screen.dart';
import 'package:ecommerce_app/features/authentecation/presentation/screens/login_screen.dart';
import 'package:ecommerce_app/features/authentecation/presentation/screens/sign_up_screen.dart';
import 'package:ecommerce_app/features/authentecation/presentation/screens/welcome_screen.dart';
import 'package:ecommerce_app/features/home/presentation/screens/home_screen.dart';
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
        name: Routs.loginScreen,
        page: () => LoginScreen(),
        binding: AuthBindiing()),
    GetPage(
      name: Routs.signUpScreen,
      page: () => SignUpScreen(),
      binding: AuthBindiing(),
    ),
    GetPage(
      name: Routs.forgetPassScreen,
      page: () => ForgetPasswordScreen(),
      binding: AuthBindiing(),
    ),
    GetPage(
      name: Routs.homeScreen,
      page: () => MainScreen(),
      binding: AuthBindiing(),
    ),
  ];
}

class Routs {
  static const welcomeScreen = '/welcomeScreen';
  static const loginScreen = '/loginScreen';
  static const signUpScreen = '/signUpScreen';
  static const forgetPassScreen = '/forgetPassScreen';
  static const homeScreen = '/homeScreen';
}
