import 'package:news_c15/data/model/source_response.dart';

abstract class NewsLocalDataSource{
  Future<List<SourceResponse>> loadSources(String category);
  Future<void> saveSources(List<SourceResponse> sources, String category);
}