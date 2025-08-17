import 'package:news_c15/data/api_manager.dart';
import 'package:news_c15/data/model/source.dart';

class NewsRemoteDataSource {
  ApiManager _apiManager;

  NewsRemoteDataSource(this._apiManager);

  Future<List<Source>> loadSources(String category) async {
    return _apiManager.getSources(category);
  }
}
