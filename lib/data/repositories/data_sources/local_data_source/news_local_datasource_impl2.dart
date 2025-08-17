import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_c15/data/model/source_response.dart';
import 'package:news_c15/data/repositories/data_sources/local_data_source/news_local_datasource.dart';

class NewsLocalDataSourceImpl2 extends  NewsLocalDataSource{
  Future<List<SourceResponse>?> loadSources(String categoryId) async{
    //todo: implement flutter sqlflite
  }

  Future<void> saveSources(String category, List<SourceResponse> sources) async{
    //todo: implement flutter sqlflite
  }
}