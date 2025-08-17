import 'package:news_c15/data/api_manager.dart';

import '../../../model/source_response.dart';

abstract class NewsRemoteDataSource{
  Future<List<SourceResponse>?> loadSources(String categoryId);
}