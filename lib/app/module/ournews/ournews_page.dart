import 'dart:convert';
import 'dart:io';

import 'package:agami24/app/data/model/news_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:optimized_cached_image/optimized_cached_image.dart';

class OurNewsPage extends StatefulWidget {
  const OurNewsPage({Key? key}) : super(key: key);
  static Route route() {
    return MaterialPageRoute(builder: (_) => const OurNewsPage());
  }

  @override
  OurNewsPageState createState() => OurNewsPageState();
}

class OurNewsPageState extends State<OurNewsPage> {

  Future<NewsModel?> fetchNews(int page) async {
    Client client = Client();
    Uri url = Uri.parse("https://azuramart.com/api/v1/blog-feature-list");
    try{
      var response = await client.post(url,body: {'page': '$page'});
      if (response.statusCode == 200) {
        final Map<String, dynamic>? body = await json.decode(response.body);
        if (response.body.isNotEmpty) {
          return NewsModel.fromJson(body);
        }
      }else {
        throw Exception('Failed to load post');
      }
    }on Exception catch(e){
      print(e);
    }

  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black87),
        systemOverlayStyle: Platform.isIOS ? SystemUiOverlayStyle.dark : const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark),
        title: const Text(
          'From Our News',
          style: TextStyle(color: Colors.black87),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: FutureBuilder<NewsModel?>(
          future: fetchNews(1),
          builder: (BuildContext context, AsyncSnapshot<NewsModel?> snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: CustomScrollView(
                  scrollDirection: Axis.vertical,
                  slivers: [
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                              (BuildContext context, index) {
                            return BlogMaterialCard(newsModel: snapshot.data,index: index,);
                          }, childCount: snapshot.data?.data!.length),
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            return Center(child: const CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

class BlogMaterialCard extends StatelessWidget {
  BlogMaterialCard({Key? key,this.newsModel,this.index}) : super(key: key);
  final NewsModel? newsModel;
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
      margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(16.0),
            height: MediaQuery.of(context).orientation == Orientation.portrait ? MediaQuery.of(context).size.width * 0.65 : MediaQuery.of(context).size.height * 1,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: OptimizedCacheImage(
                imageUrl: "https://admin.azuramart.com${newsModel!.data![index!].featureimage!}",
                imageBuilder:
                    (context, imageProvider) =>
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                          // colorFilter: ColorFilter.mode(Colors.transparent, BlendMode.clear)
                        ),
                      ),
                    ),
                placeholder: (context, url) =>
                const Center(
                      child: SizedBox(
                        height: 16,
                        width: 16,
                        child:
                        CircularProgressIndicator(
                          strokeWidth: 2.0,
                          valueColor:
                          AlwaysStoppedAnimation(
                              Color(0xFFF68721)),
                        ),
                      ),
                    ),
                errorWidget:
                    (context, url, error) =>
                    const Icon(Icons.error),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            width: double.infinity,
            child: Text('TRENDING',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,foreground: Paint()..shader = linearGradient),),
          ),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            width: double.infinity,
            child: Text('${newsModel!.data![index!].title}',textAlign: TextAlign.start,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            width: double.infinity,
            child: Text('${newsModel!.data![index!].publishdate}',textAlign: TextAlign.start,style: const TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: Colors.black54),),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            height: 16,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            width: double.infinity,
            child: Text('${newsModel!.data![index!].summary}',textAlign: TextAlign.start,style: const TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: Colors.black54),),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: OutlinedButton(
                onPressed: (){
                  // Navigator.of(context).push(
                  //     CustomRoutePageBuilder.createPageRouteLeft(
                  //         context, BlogDetailsPage(slug: newsModel!.data![index!].urlslug,)));
                },
                style: OutlinedButton.styleFrom(side: const BorderSide(width: 1.0, color: Color(0xff8928ca)),),
                child: Text('READ MORE',style: TextStyle(foreground: Paint()..shader = linearGradient,fontSize: 14),),
              ),
            ),
          ),
          const SizedBox(height: 12,)
        ],
      ),
    );
  }
}

