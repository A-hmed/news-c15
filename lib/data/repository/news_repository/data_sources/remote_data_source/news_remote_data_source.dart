import 'package:news_c15/data/api_manager.dart';
import 'package:news_c15/data/model/source_response.dart';

abstract class NewsRemoteDataSource {

  Future<List<SourceResponse>> loadSources(String category);
}
