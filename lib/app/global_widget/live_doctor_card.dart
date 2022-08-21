import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:agami24/app/routes/routes.dart';

import '../core/values/strings.dart';
class LiveDoctorCard extends StatelessWidget {
  LiveDoctorCard({Key? key,this.index}) : super(key: key);
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
        width: MediaQuery.of(context).size.width * 0.45,
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          child: InkWell(
            onTap: (){},
            borderRadius: BorderRadius.circular(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.all(0),
                  height: MediaQuery.of(context).size.width * 0.45,
                  width: double.infinity,
                  child: const ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(6),topRight: Radius.circular(6)),
                    child: Image(image: NetworkImage(AppStrings.blogImage2),fit: BoxFit.cover,),
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
                const SizedBox(height: 12,),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  child: const Text('General Physician',textAlign: TextAlign.start,style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.black87),),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  child: const Text('Dr. Zahidul Islam',textAlign: TextAlign.start,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.black),),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  child: const Text("MBBS",textAlign: TextAlign.start,style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.black54),),
                ),
                const SizedBox(height: 12,),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 10,),
                    ...List.generate(5, (index) {
                      return const Icon(Icons.star,color: Colors.amber,size: 16,);
                    }),
                    const SizedBox(width: 8,),
                    const Text("4.9",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),
                    const Text("(1245)",style: TextStyle(color: Colors.black45,fontSize: 12,fontWeight: FontWeight.normal),),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    SizedBox(width: 10,),
                    Text("৳200",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),
                  ],
                ),
                const SizedBox(height: 12,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}