import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:news_c15/data/api_manager.dart';
import 'package:news_c15/data/mappers/source_mapper.dart';
import 'package:news_c15/data/model/source_response.dart';
import 'package:news_c15/data/repository/news_repository/data_sources/local_data_source/news_local_data_source.dart';
import 'package:news_c15/data/repository/news_repository/data_sources/local_data_source/news_local_data_source_impl.dart';
import 'package:news_c15/data/repository/news_repository/data_sources/remote_data_source/news_remote_data_source.dart';
import 'package:news_c15/data/repository/news_repository/data_sources/remote_data_source/news_remote_data_source_impl.dart';
import 'package:news_c15/domain/model/source.dart';
import 'package:news_c15/domain/repositories/news_repository.dart';

class NewsRepositoryImpl extends NewsRepository {
  NewsLocalDataSource newsLocalDataSource = NewsLocalDataSourceImpl();
  NewsRemoteDataSource newsRemoteDataSource;
  Connectivity connectivity;
  SourceMapper mapper;

  NewsRepositoryImpl({
     required this.newsRemoteDataSource,required this.newsLocalDataSource,required this.connectivity,required this.mapper});

  Future<List<Source>> loadSources(String category) async {
    List<ConnectivityResult> result = await connectivity.checkConnectivity();

    if (result.contains(ConnectivityResult.wifi) ||
        result.contains(ConnectivityResult.mobile)) {
      var sourcesResponse = await newsRemoteDataSource.loadSources(category);
      newsLocalDataSource.saveSources(sourcesResponse, category);
      return mapper.fromDataModels(sourcesResponse);
    } else {
      var sourcesResponse = await newsLocalDataSource.loadSources(category);
      return mapper.fromDataModels(sourcesResponse);
    }
  }
}
