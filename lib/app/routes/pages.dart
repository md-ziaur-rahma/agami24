import 'package:agami24/app/module/home/home_screen.dart';
import 'package:agami24/app/module/login/login.dart';
import 'package:agami24/app/module/no_internet/no_internet.dart';
import 'package:agami24/app/module/ournews/ournews_page.dart';
import 'package:agami24/app/module/splash/splash_screen.dart';
import 'package:agami24/app/routes/routes.dart';
import 'package:get/get.dart';

class Pages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const Login(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: Routes.NO_INTERNET,
      page: () => const NoInternetScreen(),
    ),
    GetPage(
      name: Routes.blog,
      page: () => const OurNewsPage(),
    ),
  ];
}