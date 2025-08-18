
import 'package:news_c15/domain/repositories/news_repository.dart';
import 'package:news_c15/domain/model/source.dart';

class LoadSourcesByCategoryUseCase {
  NewsRepository newsRepository;

  LoadSourcesByCategoryUseCase(this.newsRepository);

  Future<List<Source>> execute(String category) {
    return newsRepository.loadSources(category);
  }
}
