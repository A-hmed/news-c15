import 'package:flutter/material.dart';
import 'package:news_c15/domain/model/source.dart';
import 'package:news_c15/domain/usecases/load_articles_by_source.dart';

class NewsViewModel extends ChangeNotifier {
  LoadSourcesByCategoryUseCase loadSourcesUseCase;
  NewsViewModel(this.loadSourcesUseCase);
  var isLoading = false;
  var error = "";
  List<Source> sources = [];

  Future<void> loadSources(String category) async {
    isLoading = true;
    notifyListeners();
    try {
      sources = await loadSourcesUseCase.execute(category);
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      error = e.toString();
      notifyListeners();
    }
  }
}