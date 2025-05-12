import '../../features/authentecation/logic/binding/auth_bindiing.dart';
import '../../features/authentecation/presentation/screens/forget_password_screen.dart';
import '../../features/authentecation/presentation/screens/login_screen.dart';
import '../../features/authentecation/presentation/screens/sign_up_screen.dart';
import '../../features/authentecation/presentation/screens/welcome_screen.dart';
import '../../features/home/logic/binding/cart_binding.dart';
import '../../features/home/logic/binding/home_binding.dart';
import '../../features/home/logic/binding/product_binding.dart';
import '../../features/home/presentation/screens/cart_screen.dart';
import 'package:get/get.dart';

import '../../features/home/presentation/screens/main_screen.dart';

class AppRouter {
  //initial
  static const welcome = Routs.welcomeScreen;
  static const mainScreen = Routs.mainScreen;

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
      name: Routs.mainScreen,
      page: () => MainScreen(),
      bindings: [
        AuthBindiing(),
        HomeBinding(),
        ProductBinding(),
        CartBinding(),
      ],
    ),
    GetPage(
      name: Routs.cartScreen,
      page: () => CartScreen(),
      bindings: [
        AuthBindiing(),
        ProductBinding(),
      ],
    ),
  ];
}

class Routs {
  static const welcomeScreen = '/welcomeScreen';
  static const loginScreen = '/loginScreen';
  static const signUpScreen = '/signUpScreen';
  static const forgetPassScreen = '/forgetPassScreen';
  static const mainScreen = '/mainScreen';
  static const cartScreen = '/cartScreen';
}
