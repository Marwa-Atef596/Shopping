import 'package:ecommerce_app/features/home/presentation/screens/categories_screen.dart';
import 'package:ecommerce_app/features/home/presentation/screens/favorite_screen.dart';
import 'package:ecommerce_app/features/home/presentation/screens/home_screen.dart';
import 'package:ecommerce_app/features/home/presentation/screens/settings_screen.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt currentIndex = 0.obs;//stream data

  final tabs = [
    HomeScreen(),
    CategoriesScreen(),
    FavoriteScreen(),
    SettingsScreen(),
  ].obs;

  final title = [
    'Asroo Shop',
    'Categories',
    'Favorites',
    'Settings',
  ].obs;
}
