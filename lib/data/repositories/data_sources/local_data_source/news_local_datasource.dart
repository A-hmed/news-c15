import 'package:news_c15/data/model/source_response.dart';

abstract class NewsLocalDataSource{
  Future<List<SourceResponse>?> loadSources(String categoryId);

  Future<void> saveSources(String category, List<SourceResponse> sources);
}