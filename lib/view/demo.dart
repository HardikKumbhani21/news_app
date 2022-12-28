// import 'package:flutter/cupertino.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:news_app/view/detail_screen.dart';
//
// import 'api_service/get_news_service.dart';
// import 'model/news_model.dart';
//
// class MainScreen extends StatefulWidget {
//   const MainScreen({Key? key}) : super(key: key);
//
//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }
//
// class _MainScreenState extends State<MainScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder(
//         future: GetNewsService.getNewsData(),
//         builder: (BuildContext context, AsyncSnapshot<NewsModel?> snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             return ListView.builder(
//               itemCount: snapshot.data!.articles!.length,
//               itemBuilder: (BuildContext context, int index) {
//                 final news = snapshot.data!.articles![index];
//                 return Column(
//                   children: [
//                     InkWell(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => DetailScreen(
//                                   image: news.urlToImage,
//                                   title: news.title,
//                                   content: news.content,
//                                   description: news.description,
//                                   author: news.author,
//                                   url: news.url),
//                             ));
//                       },
//                       child: Hero(
//                         tag: "${news.urlToImage}",
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Card(
//                               child: Image.network(
//                                 news.urlToImage == null
//                                     ? "https://thumbs.dreamstime.com/b/no-image-available-icon-flat-vector-no-image-available-icon-flat-vector-illustration-132482953.jpg"
//                                     : news.urlToImage.toString(),
//                                 height: 120,
//                                 width: 150,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                             const SizedBox(
//                               width: 15,
//                             ),
//                             Flexible(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.only(top: 10),
//                                     child: Text(
//                                       news.title.toString(),
//                                       style: const TextStyle(
//                                         fontSize: 15,
//                                       ),
//                                     ),
//                                   ),
//                                   const SizedBox(
//                                     height: 10,
//                                   ),
//                                   Text(
//                                     news.publishedAt.toString().split(' ')[0],
//                                     style: const TextStyle(
//                                       fontSize: 15,
//                                       color: Colors.grey,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     const Padding(
//                       padding: EdgeInsets.symmetric(
//                         horizontal: 15,
//                       ),
//                       child: Divider(
//                         thickness: 2,
//                       ),
//                     )
//                   ],
//                 );
//               },
//             );
//           } else {
//             return const Center(child: CupertinoActivityIndicator());
//           }
//         },
//       ),
//     );
//   }
// }
