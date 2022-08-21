import 'package:flutter/material.dart';
import 'package:agami24/app/core/values/colors.dart';
class PageLoader2 extends StatelessWidget {
  const PageLoader2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 16),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6)
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: AppColors.mainColor,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            const Text("Loading...")
          ],
        ),
      ),
    );
  }
}
