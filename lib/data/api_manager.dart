import 'package:dio/dio.dart';
import 'package:news_c15/data/model/article.dart';
import 'package:news_c15/data/model/articles_response.dart';
import 'package:news_c15/data/model/source.dart';
import 'package:news_c15/data/model/sources_response.dart';

class ApiManager {
  final String _apiKey = "337dc2b5fe7c467aacde1b358cbe785b";
  final String _baseUrl = "https://newsapi.org/v2";

  Future<List<Source>> getSources() async {
    Dio dio = Dio();
    try {
      Response serverResponse = await dio
          .get("$_baseUrl/top-headlines/sources?apiKey=$_apiKey");
      print("Server response : ${serverResponse.data}");
      SourcesResponse response = SourcesResponse.fromJson(serverResponse.data);
      if (serverResponse.statusCode! >= 200 &&
          serverResponse.statusCode! < 300 &&
          response.sources != null) {
        // serverResponse.data ///Json
        return response.sources!;
      } else {
        throw "Network error";
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Article>> getArticles(String sourceId) async {
    Dio dio = Dio();
    try {
      Response serverResponse = await dio.get(
          "$_baseUrl/everything",
          queryParameters: {"apiKey": _apiKey, "sources": sourceId});
      ArticlesResponse response = ArticlesResponse.fromJson(serverResponse.data);
      if (serverResponse.statusCode! >= 200 &&
          serverResponse.statusCode! < 300 &&
          response.articles != null) {
        // serverResponse.data ///Json
        return response.articles!;
      } else {
        throw "Network error";
      }
    } catch (e) {
      rethrow;
    }
  }
}
