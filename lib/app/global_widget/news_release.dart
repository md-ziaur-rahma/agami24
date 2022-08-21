import 'package:flutter/material.dart';
import 'package:agami24/app/core/values/colors.dart';

import '../core/values/strings.dart';
class NewsReleaseCard extends StatelessWidget {
  NewsReleaseCard({Key? key,this.index}) : super(key: key);
  final int? index;

  final Shader linearGradient = const LinearGradient(
    // colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],
    colors: <Color>[Color(0xffff0080), Color(0xff8928ca)],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      shadowColor: Colors.black12,
      margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DecoratedBox(
              position: DecorationPosition.background,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(AppStrings.blogImage2),fit: BoxFit.cover,
                ),
              ),
              child: Container(
                height: MediaQuery.of(context).size.width * 0.5,
                width: double.infinity,
                color: Colors.black.withOpacity(0.3),
                margin: const EdgeInsets.only(right: 0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 16),
                      width: double.infinity,
                      color: AppColors.mainColor.withOpacity(0.7),
                      child: const Text('News Release',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white),),
                    )
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              width: double.infinity,
              child: Text(AppStrings.newsHeadline,
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: AppColors.mainColor.withOpacity(0.6)),),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 6),
              width: double.infinity,
              child: Text("by Kambaii Corporation",textAlign: TextAlign.start,
                style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,
                  color: AppColors.mainColor.withOpacity(1),),)
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              width: double.infinity,
              child: const Text("3 reasons ethical AI is a must-have in healthcare AI is a must-have in healthcare AI is a must-have in healthcare",maxLines: 3,overflow: TextOverflow.ellipsis,textAlign: TextAlign.start,style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: Colors.black54),),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: OutlinedButton(
                  onPressed: (){

                  },
                  style: OutlinedButton.styleFrom(side: const BorderSide(width: 1.0, color: Color(0xff8928ca)),),
                  child: Text('Learn More',style: TextStyle(foreground: Paint()..shader = linearGradient,fontSize: 14),),
                ),
              ),
            ),
            const SizedBox(height: 12,)
          ],
        ),
      ),
    );
  }
}