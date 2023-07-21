import 'package:get/get.dart';
import 'package:grocery_application/screens/grocery_detail_screen/grocery_detail_screen.dart';
import 'package:grocery_application/screens/grocery_screen/grocery_screen.dart';
import 'package:grocery_application/screens/grocery_stores_screen/grocery_store_screen.dart';
import 'package:grocery_application/screens/splash_screen.dart';
import 'package:grocery_application/screens/user_details_screen/user_details_screen.dart';

class AppRoutes {
  static List<GetPage<dynamic>>? routes = [
    GetPage(name: '/', page: () => const SplashScreen()),
    GetPage(name: SplashScreen.routeName, page: () => const SplashScreen()),
    GetPage(
        name: UserDetailsScreen.routeName,
        page: () => const UserDetailsScreen()),
    GetPage(name: GroceryScreen.routeName, page: () => const GroceryScreen()),
    GetPage(
        name: GroceryStoreScreen.routeName,
        page: () => const GroceryStoreScreen()),
    GetPage(
        name: GroceryDetailScreen.routeName,
        page: () => const GroceryDetailScreen()),
  ];
}
