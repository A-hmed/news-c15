import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_c15/data/model/source_response.dart';
import 'package:news_c15/data/repository/news_repository/data_sources/local_data_source/news_local_data_source.dart';

class NewsLocalDataSourceImpl extends NewsLocalDataSource{
  Future<List<SourceResponse>> loadSources(String category) async{
    var box = await Hive.openBox("news");
    var sources = box.get(category);
    return sources;
  }
  Future<void> saveSources(List<SourceResponse> sources, String category) async{
    var box = await Hive.openBox("news");
    box.put(category, sources);
  }
}