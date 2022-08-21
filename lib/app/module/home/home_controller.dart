import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:agami24/app/core/values/colors.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  Future<bool> onBackPressed(BuildContext context) async {
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        contentPadding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
        title: const Text('Are you sure you want to close application?',style: TextStyle(
            color: Colors.black87,
            fontSize: 14,
            fontWeight: FontWeight.w400),),
        actions: <Widget>[
          TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text(
                'No',
                style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              )),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text(
                'Yes',
                style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              )),
        ],
      ),
    )) ??
        false;
  }

  void changeLoading(bool value){
    isLoading.value = value;
    update();
  }
}