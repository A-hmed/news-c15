import 'package:news_c15/domain/model/source.dart';

abstract class NewsRepository {

  Future<List<Source>?> loadSources(String categoryId);
}
