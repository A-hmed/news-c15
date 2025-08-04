import 'package:dio/dio.dart';
import 'package:news_c15/data/model/articles_response.dart';
import 'package:news_c15/data/model/source.dart';
import 'package:news_c15/data/model/sources_response.dart';

import 'model/article.dart';

class ApiManager {
  const ApiManager();

  final String _apiKey = "337dc2b5fe7c467aacde1b358cbe785b";
  final String _baseUrl = "https://newsapi.org/v2";

  Future<List<Source>?> loadSources() async {
    try {
      Dio dio = Dio();
      Response response =
      await dio.get("$_baseUrl/top-headlines/sources", queryParameters: {
        "apiKey": _apiKey,
      });
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        SourcesResponse myResponse = SourcesResponse.fromJson(response.data);
        return myResponse.sources;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Article>?> loadArticles(String sourceId) async {
    try {
      Dio dio = Dio();
      Response response =
      await dio.get("$_baseUrl/everything", queryParameters: {
        "apiKey": _apiKey,
        "sources":sourceId
      });
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        ArticlesResponse myResponse = ArticlesResponse.fromJson(response.data);
        return myResponse.articles;
      }
    } catch (e) {
      rethrow;
    }
  }
}
