import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import 'app/core/values/colors.dart';
import 'app/module/splash/splash_screen.dart';
import 'app/routes/pages.dart';

void main() {
  //.. these lines for using app only portrait mode....
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Kambaii Health',
      debugShowCheckedModeBanner: false,
      transitionDuration: const Duration(milliseconds: 300),
      defaultTransition: Transition.cupertino,
      theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.lightBlue,
          buttonTheme: ButtonThemeData(
              buttonColor: AppColors.mainColor
          )
      ),
      home: const SplashScreen(),
      getPages: Pages.pages,
    );
  }
}