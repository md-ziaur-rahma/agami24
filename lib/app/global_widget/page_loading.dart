import 'package:flutter/material.dart';
import 'package:agami24/app/core/values/colors.dart';
class PageLoader extends StatelessWidget {
  const PageLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      width: 24,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        color: AppColors.mainColor,
      ),
    );
  }
}
