import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:news_c15/data/api_manager.dart';
import 'package:news_c15/data/mappers/source_mapper.dart';
import 'package:news_c15/data/repositories/data_sources/local_data_source/news_local_datasource.dart';
import 'package:news_c15/data/repositories/data_sources/local_data_source/news_local_datasource_impl.dart';
import 'package:news_c15/data/repositories/data_sources/remote_datasource/news_remote_datasource.dart';
import 'package:news_c15/data/repositories/data_sources/remote_datasource/news_remote_datasource_impl.dart';
import 'package:news_c15/data/repositories/news_repository_impl.dart';
import 'package:news_c15/domain/repositories/news_repository.dart';
import 'package:news_c15/domain/usecases/get_sources_usecase.dart';
import 'package:news_c15/ui/screens/news/news_view_model.dart';

var getIt = GetIt.instance;

void configureDependcies() {
  getIt.registerSingleton(Connectivity());
  getIt.registerSingleton(SourceMapper());
  getIt.registerSingleton<NewsLocalDataSource>(NewsLocalDataSourceImpl());
  getIt.registerSingleton(ApiManager.instance);
  getIt.registerSingleton<NewsRemoteDataSource>(
      NewsRemoteDataSourceImpl(getIt()));

  getIt.registerSingleton<NewsRepository>(NewsRepositoryImpl(
    remoteDataSource: getIt(),
    localDataSource: getIt(),
    connectivity: getIt(),
    sourceMapper: getIt(),
  ));

  getIt.registerSingleton(GetSourcesByCategoryUseCase(getIt()));

  getIt.registerFactory(()=> NewsViewModel(getIt()));
}
