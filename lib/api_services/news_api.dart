import 'package:http/http.dart' as http;
import 'package:news_app/model/news_model.dart';

class NewsApiServices {
  static DateTime dateTime = DateTime.now();
  static Future<NewsModel?> getnewsdata() async {
    http.Response response = await http.get(
      Uri.parse(
          'https://newsapi.org/v2/everything?q=tesla&from=${dateTime.toString().split(' ')[0]}&sortBy=publishedAt&apiKey=d76270a669da4d239fac38d388687395'),
    );
    if (response.statusCode == 200) {
      return newsmodelFromJson(response.body);
    } else {
      return null;
    }
  }
}
