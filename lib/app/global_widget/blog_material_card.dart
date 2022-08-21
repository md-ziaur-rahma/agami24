import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:agami24/app/routes/routes.dart';

import '../core/values/strings.dart';
class BlogMaterialCard extends StatelessWidget {
  BlogMaterialCard({Key? key,this.index}) : super(key: key);
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.all(16.0),
              height: MediaQuery.of(context).size.width * 0.45,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: const Image(image: NetworkImage(AppStrings.blogImage2),fit: BoxFit.cover,),
                // child: OptimizedCacheImage(
                //   imageUrl: AppStrings.blogImage2,
                //   imageBuilder:
                //       (context, imageProvider) =>
                //       Container(
                //         decoration: BoxDecoration(
                //           image: DecorationImage(
                //             image: imageProvider,
                //             fit: BoxFit.cover,
                //             // colorFilter: ColorFilter.mode(Colors.transparent, BlendMode.clear)
                //           ),
                //         ),
                //       ),
                //   placeholder: (context, url) =>
                //   const Center(
                //     child: SizedBox(
                //       height: 16,
                //       width: 16,
                //       child:
                //       CircularProgressIndicator(
                //         strokeWidth: 2.0,
                //         valueColor:
                //         AlwaysStoppedAnimation(
                //             Color(0xFFF68721)),
                //       ),
                //     ),
                //   ),
                //   errorWidget:
                //       (context, url, error) =>
                //   const Icon(Icons.error),
                // ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              width: double.infinity,
              child: const Text('3 reasons ethical AI is a must-have in healthcare',textAlign: TextAlign.start,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              width: double.infinity,
              child: const Text('12-02-2022',textAlign: TextAlign.start,style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: Colors.black54),),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              height: 16,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              width: double.infinity,
              child: const Text("3 reasons ethical AI is a must-have in healthcare",maxLines: 3,overflow: TextOverflow.ellipsis,textAlign: TextAlign.start,style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: Colors.black54),),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: OutlinedButton(
                  onPressed: (){
                    // Get.toNamed(Routes.BLOG_DETAILS);
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