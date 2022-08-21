import 'package:flutter/material.dart';
import 'package:agami24/app/core/values/colors.dart';

import '../core/values/strings.dart';
class FeaturedSolutionCard extends StatelessWidget {
  FeaturedSolutionCard({Key? key,this.index}) : super(key: key);
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
                    image: NetworkImage(AppStrings.blogImage3),fit: BoxFit.cover,
                  ),
              ),
              child: Container(
                height: MediaQuery.of(context).size.width * 0.5,
                width: double.infinity,
                color: Colors.black.withOpacity(0.3),
                margin: const EdgeInsets.only(right: 0),
                child: Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 16),
                        width: double.infinity,
                        color: AppColors.mainColor.withOpacity(0.7),
                        child: const Text('Ambulatory',
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),),
                    )
                ),
              ),
            ),
            // Container(
            //   margin: const EdgeInsets.all(0.0),
            //   height: MediaQuery.of(context).size.width * 0.45,
            //   width: double.infinity,
            //   foregroundDecoration: BoxDecoration(
            //     color: Colors.black.withOpacity(0.3),
            //     image: const DecorationImage(
            //       image: NetworkImage(AppStrings.blogImage2),fit: BoxFit.cover,
            //     )
            //   ),
            //   // child: const ClipRRect(
            //   //   borderRadius: BorderRadius.only(topLeft: Radius.circular(6), topRight: Radius.circular(6)),
            //   //   child: Image(image: NetworkImage(AppStrings.blogImage2),fit: BoxFit.cover,),
            //   //   // child: OptimizedCacheImage(
            //   //   //   imageUrl: AppStrings.blogImage2,
            //   //   //   imageBuilder:
            //   //   //       (context, imageProvider) =>
            //   //   //       Container(
            //   //   //         decoration: BoxDecoration(
            //   //   //           image: DecorationImage(
            //   //   //             image: imageProvider,
            //   //   //             fit: BoxFit.cover,
            //   //   //             // colorFilter: ColorFilter.mode(Colors.transparent, BlendMode.clear)
            //   //   //           ),
            //   //   //         ),
            //   //   //       ),
            //   //   //   placeholder: (context, url) =>
            //   //   //   const Center(
            //   //   //     child: SizedBox(
            //   //   //       height: 16,
            //   //   //       width: 16,
            //   //   //       child:
            //   //   //       CircularProgressIndicator(
            //   //   //         strokeWidth: 2.0,
            //   //   //         valueColor:
            //   //   //         AlwaysStoppedAnimation(
            //   //   //             Color(0xFFF68721)),
            //   //   //       ),
            //   //   //     ),
            //   //   //   ),
            //   //   //   errorWidget:
            //   //   //       (context, url, error) =>
            //   //   //   const Icon(Icons.error),
            //   //   // ),
            //   // ),
            // ),
            const SizedBox(
              height: 8,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              width: double.infinity,
              child: const Text('Ambulatory',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              height: 10,
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