import 'package:agami24/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:agami24/app/module/home/home_controller.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../core/utils/keys.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller){
        return ModalProgressHUD(
          inAsyncCall: controller.isLoading.value,
          child: WillPopScope(
            onWillPop: () => controller.onBackPressed(context),
            child: Scaffold(
              body: CustomScrollView(
                scrollDirection: Axis.vertical,
                slivers: [
                  SliverAppBar(
                    title: const Text("Agami24"),
                    pinned: true,
                    backgroundColor: Colors.white,
                    elevation: 0,
                    systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.white,statusBarIconBrightness: Brightness.dark),
                    leading: IconButton(
                      onPressed: (){
                        AppKeys.mainScaffoldKey.currentState!.openDrawer();
                      },
                      icon: const Icon(Icons.menu),
                    ),
                    actions: [
                      IconButton(
                          onPressed: (){
                            Get.toNamed(Routes.blog);
                          },
                          icon: const Icon(Icons.person_pin,color: Colors.black38,)
                      )
                    ],
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: Center(
                        child: Text("Home Page..."),
                      ),
                    ),
                  )
                ],
              )
            ),
          ),
        );
      },
    );
  }
}

