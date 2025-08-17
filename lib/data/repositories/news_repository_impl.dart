import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:news_c15/data/mappers/source_mapper.dart';
import 'package:news_c15/data/repositories/data_sources/local_data_source/news_local_datasource.dart';
import 'package:news_c15/data/repositories/data_sources/local_data_source/news_local_datasource_impl.dart';
import 'package:news_c15/data/repositories/data_sources/remote_datasource/news_remote_datasource.dart';
import 'package:news_c15/domain/model/source.dart';
import 'package:news_c15/domain/repositories/news_repository.dart';

class NewsRepositoryImpl extends NewsRepository {
  NewsRemoteDataSource remoteDataSource;
  NewsLocalDataSource localDataSource = NewsLocalDataSourceImpl();
  Connectivity connectivity;
  SourceMapper sourceMapper;

  NewsRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.connectivity,
      required this.sourceMapper});

  Future<List<Source>?> loadSources(String categoryId) async {
    var result = await connectivity.checkConnectivity();
    if (result.contains(ConnectivityResult.mobile) ||
        result.contains(ConnectivityResult.wifi)) {
      var sources = await remoteDataSource.loadSources(categoryId);
      localDataSource.saveSources(categoryId, sources ?? []);
      return sourceMapper.fromDataModels(sources ?? []);
    } else {
      var sources = await localDataSource.loadSources(categoryId);
      return sourceMapper.fromDataModels(sources ?? []);
    }
  }
}
