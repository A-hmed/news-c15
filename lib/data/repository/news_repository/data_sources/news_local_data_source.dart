import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_c15/data/model/source.dart';

class NewsLocalDataSource{
  Future<List<Source>> loadSources(String category) async{
    var box = await Hive.openBox("news");
    var sources = box.get(category);
    return sources;
  }
  Future<void> saveSources(List<Source> sources, String category) async{
    var box = await Hive.openBox("news");
    box.put(category, sources);
  }
}