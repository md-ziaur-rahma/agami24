import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultAppBar{
  myAppBar(String title){
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.black87),
      title: Text(title,style: const TextStyle(color: Colors.black87),),
      backgroundColor: Colors.white,
      elevation: 0,
      systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.white,statusBarIconBrightness: Brightness.dark),
    );
  }
}
