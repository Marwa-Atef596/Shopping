import '../../presentation/screens/categories_screen.dart';
import '../../presentation/screens/favorite_screen.dart';
import '../../presentation/screens/home_screen.dart';
import '../../presentation/screens/settings_screen.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt currentIndex = 0.obs; //stream data

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
