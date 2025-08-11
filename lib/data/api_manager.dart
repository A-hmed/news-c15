import 'package:dio/dio.dart';
import 'package:news_c15/data/model/article.dart';
import 'package:news_c15/data/model/articles_response.dart';
import 'package:news_c15/data/model/source.dart';
import 'package:news_c15/data/model/sources_response.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiManager {

  final String _baseUrl = "https://newsapi.org/v2";
  late Dio dio;

  ApiManager() {
    dio = Dio(BaseOptions(
        baseUrl: _baseUrl,
    ));

    dio.interceptors.add(PrettyDioLogger());
    dio.interceptors.add(AppInterceptor());
  }

  Future<List<Source>> getSources(String category) async {
    try {
      Response serverResponse =
          await dio.get("/top-headlines/sources", queryParameters: {
        "category": category,
      });
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
    try {
      Response serverResponse =
          await dio.get("/everything", queryParameters: {"sources": sourceId});
      ArticlesResponse response =
          ArticlesResponse.fromJson(serverResponse.data);
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
class AppInterceptor extends Interceptor{
  final String _apiKey = "337dc2b5fe7c467aacde1b358cbe785b";

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({"X-Api-Key": _apiKey});
    super.onRequest(options, handler);
  }
}
