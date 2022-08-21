import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:agami24/app/core/values/colors.dart';
import 'package:agami24/app/core/values/strings.dart';
import 'package:agami24/app/module/splash/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashController>(
        init: SplashController(),
        builder: (controller){
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Expanded(
                flex: 1,
                child: Text("agami24",style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 24),),
              ),
              const Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(AppStrings.copyWrite,textAlign: TextAlign.center,),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}


