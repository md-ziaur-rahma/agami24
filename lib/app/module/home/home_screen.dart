import 'dart:convert';
import 'package:agami24/app/module/ournews/ournews_page.dart';
import 'package:agami24/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:agami24/app/module/home/home_controller.dart';
import 'package:http/http.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../core/utils/keys.dart';
import '../../data/model/news_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Future<NewsModel?> fetchNews(int page) async {
    Client client = Client();
    Uri url = Uri.parse("https://azuramart.com/api/v1/blog-feature-list");
    try{
      var response = await client.post(url,body: {'page': '$page'});
      if (response.statusCode == 200) {
        final Map<String, dynamic>? body = await json.decode(response.body);
        if (response.body.isNotEmpty) {
          return NewsModel.fromJson(body);
        }
      }else {
        throw Exception('Failed to load post');
      }
    }on Exception catch(e){
      print(e);
    }

  }

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
                  FutureBuilder<NewsModel?>(
                    future: fetchNews(1),
                    builder: (BuildContext context, AsyncSnapshot<NewsModel?> snapshot) {
                      if (snapshot.hasData) {
                        return SliverList(
                          delegate: SliverChildBuilderDelegate(
                                  (BuildContext context, index) {
                                return BlogMaterialCard(newsModel: snapshot.data,index: index,);
                              }, childCount: snapshot.data?.data!.length),
                        );
                      } else if (snapshot.hasError) {
                        return SliverToBoxAdapter(
                          child: Center(
                            child: Text(snapshot.error.toString()),
                          ),
                        );
                      }
                      return const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()));
                    },
                  ),
                ],
              )
            ),
          ),
        );
      },
    );
  }
}

