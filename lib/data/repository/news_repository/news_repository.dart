import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:news_c15/data/model/source.dart';
import 'package:news_c15/data/repository/news_repository/data_sources/news_local_data_source.dart';
import 'package:news_c15/data/repository/news_repository/data_sources/news_remote_data_source.dart';

class NewsRepository {
  NewsLocalDataSource newsLocalDataSource;
  NewsRemoteDataSource newsRemoteDataSource;
  Connectivity connectivity;

  NewsRepository(
      this.newsRemoteDataSource, this.newsLocalDataSource, this.connectivity);

  Future<List<Source>> loadSources(String category) async {
    List<ConnectivityResult> result = await connectivity.checkConnectivity();

    if (result.contains(ConnectivityResult.wifi) ||
        result.contains(ConnectivityResult.mobile)) {
      var sources = await newsRemoteDataSource.loadSources(category);
      newsLocalDataSource.saveSources(sources, category);
      return sources;
    } else {
      return newsLocalDataSource.loadSources(category);
    }
  }
}
