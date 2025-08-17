import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_c15/data/model/source_response.dart';
import 'package:news_c15/data/repositories/data_sources/local_data_source/news_local_datasource.dart';

class NewsLocalDataSourceImpl extends  NewsLocalDataSource{
  Future<List<SourceResponse>?> loadSources(String categoryId) async{
    var box = await Hive.openBox('news');
    var sources = box.get(categoryId);
    return sources;
  }

  Future<void> saveSources(String category, List<SourceResponse> sources) async{
    var box = await Hive.openBox('news');
    box.put(category, sources);
  }
}