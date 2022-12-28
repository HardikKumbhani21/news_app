import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/api_services/news_api.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/view/demo2.dart';

import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: FutureBuilder(
        future: NewsApiServices.getnewsdata(),
        builder: (BuildContext context, AsyncSnapshot<NewsModel?> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: snapshot.data!.articles!.length,
              itemBuilder: (context, index) {
                final news = snapshot.data!.articles![index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                    image: news.urlToImage,
                                    url: news.url,
                                    title: news.title,
                                    content: news.content,
                                    description: news.description,
                                    author: news.author),
                              ));
                        },
                        child: Hero(
                          tag: '${news.urlToImage}',
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: height * 0.01),
                                height: height * 0.130,
                                width: width * 0.3,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                ),
                                child: news.urlToImage == null
                                    ? Image.network(
                                        "https://thumbs.dreamstime.com/b/no-image-available-icon-flat-vector-no-image-available-icon-flat-vector-illustration-132482953.jpg",
                                        height: height * 0.150,
                                        width: width * 0.3,
                                        fit: BoxFit.fill,
                                      )
                                    : Image.network(
                                        news.urlToImage.toString(),
                                        height: height * 0.150,
                                        width: width * 0.3,
                                        fit: BoxFit.fill,
                                      ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                news.title.toString(),
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              news.publishedAt.toString().split(' ')[0],
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        child: Divider(
                          color: Colors.grey,
                          thickness: 2,
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          } else {
            return Center(child: CupertinoActivityIndicator());
          }
        },
      ),
    );
  }
}
