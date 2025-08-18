import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:news_c15/data/api_manager.dart';
import 'package:news_c15/data/mappers/source_mapper.dart';
import 'package:news_c15/data/repository/news_repository/data_sources/local_data_source/news_local_data_source.dart';
import 'package:news_c15/data/repository/news_repository/data_sources/local_data_source/news_local_data_source_impl.dart';
import 'package:news_c15/data/repository/news_repository/data_sources/remote_data_source/news_remote_data_source.dart';
import 'package:news_c15/data/repository/news_repository/data_sources/remote_data_source/news_remote_data_source_impl.dart';
import 'package:news_c15/data/repository/news_repository/news_repository_impl.dart';
import 'package:news_c15/domain/repositories/news_repository.dart';
import 'package:news_c15/domain/usecases/load_articles_by_source.dart';
import 'package:news_c15/ui/screens/news/news_viewmodel.dart';

final getIt = GetIt.instance;

void configureDependcies() {
  getIt.registerSingleton(ApiManager.instance);
  getIt.registerSingleton<NewsRemoteDataSource>(
      NewsRemoteDataSourceImpl(getIt()));
  getIt.registerSingleton<NewsLocalDataSource>(NewsLocalDataSourceImpl());
  getIt.registerSingleton(Connectivity());
  getIt.registerSingleton(SourceMapper());
  getIt.registerSingleton<NewsRepository>(NewsRepositoryImpl(
      newsRemoteDataSource: getIt(),
      newsLocalDataSource: getIt(),
      connectivity: getIt(),
      mapper: getIt()));
  getIt.registerSingleton(LoadSourcesByCategoryUseCase(getIt()));
  getIt.registerSingleton(NewsViewModel(getIt()));
}
