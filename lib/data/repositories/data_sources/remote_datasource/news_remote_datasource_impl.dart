import 'package:news_c15/data/api_manager.dart';
import 'package:news_c15/data/repositories/data_sources/remote_datasource/news_remote_datasource.dart';

import '../../../model/source_response.dart';

class NewsRemoteDataSourceImpl extends NewsRemoteDataSource{
  ApiManager apiManager;
  NewsRemoteDataSourceImpl(this.apiManager);
  Future<List<SourceResponse>?> loadSources(String categoryId){
    return apiManager.loadSources(categoryId);
  }
}