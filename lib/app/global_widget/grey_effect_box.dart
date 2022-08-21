import 'package:flutter/material.dart';
import 'package:agami24/app/core/values/colors.dart';

class GreyEffectBox extends StatelessWidget {
  const GreyEffectBox({Key? key,required this.height}) : super(key: key);
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.effectColor,
        borderRadius: BorderRadius.circular(10)
      )
    );
  }
}
