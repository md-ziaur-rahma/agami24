import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:agami24/app/core/values/colors.dart';
import 'package:optimized_cached_image/optimized_cached_image.dart';

class ShowImageScreen extends StatelessWidget {
  const ShowImageScreen({Key? key,required this.url}) : super(key: key);
  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: (){
            Get.back();
          },
        ),
        iconTheme: const IconThemeData(color: Colors.black87),
        systemOverlayStyle: Platform.isIOS ? SystemUiOverlayStyle.dark : const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 1,
              child: InteractiveViewer(
                constrained: true,
                scaleEnabled: true,
                maxScale: 3,
                minScale: 1,
                boundaryMargin: const EdgeInsets.all(0),
                child: Center(
                  child: OptimizedCacheImage(
                    imageUrl: url,
                    imageBuilder:
                        (context, imageProvider) =>
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              // fit: BoxFit.cover,
                              // colorFilter: ColorFilter.mode(Colors.transparent, BlendMode.clear)
                            ),
                          ),
                        ),
                    placeholder: (context, url) =>
                        Center(
                          child: SizedBox(
                            height: 16,
                            width: 16,
                            child:
                            CircularProgressIndicator(
                              strokeWidth: 2.0,
                              valueColor:
                              AlwaysStoppedAnimation(
                                  AppColors.mainColor),
                            ),
                          ),
                        ),
                    errorWidget:
                        (context, url, error) =>
                    const Icon(Icons.error),
                  )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DetailsImageView extends StatelessWidget {
  final String? image;
  const DetailsImageView({Key? key, this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: OptimizedCacheImage(
          imageUrl: image!,
          imageBuilder:
              (context, imageProvider) =>
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    // fit: BoxFit.cover,
                    // colorFilter: ColorFilter.mode(Colors.transparent, BlendMode.clear)
                  ),
                ),
              ),
          placeholder: (context, url) =>
              Center(
                child: SizedBox(
                  height: 16,
                  width: 16,
                  child:
                  CircularProgressIndicator(
                    strokeWidth: 2.0,
                    valueColor:
                    AlwaysStoppedAnimation(
                        AppColors.mainColor),
                  ),
                ),
              ),
          errorWidget:
              (context, url, error) =>
          const Icon(Icons.error),
        )
    );
  }
}

