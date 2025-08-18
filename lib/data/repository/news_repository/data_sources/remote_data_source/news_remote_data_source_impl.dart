import 'package:news_c15/data/api_manager.dart';
import 'package:news_c15/data/model/source_response.dart';
import 'package:news_c15/data/repository/news_repository/data_sources/remote_data_source/news_remote_data_source.dart';

class NewsRemoteDataSourceImpl extends NewsRemoteDataSource {
  ApiManager _apiManager;

  NewsRemoteDataSourceImpl(this._apiManager);

  Future<List<SourceResponse>> loadSources(String category) async {
    return _apiManager.getSources(category);
  }
}
