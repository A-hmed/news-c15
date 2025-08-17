import 'package:flutter/material.dart';
import 'package:news_c15/domain/model/source.dart';
import 'package:news_c15/domain/usecases/get_sources_usecase.dart';
///SoliD
///State Holder
class NewsViewModel extends ChangeNotifier {
  GetSourcesByCategoryUseCase getSourcesUseCase;

  NewsViewModel(this.getSourcesUseCase);

  List<Source> sources = [];
  var isLoading = false;
  var errorMessage = "";

  loadSources(String categoryId) async {
    try {
      isLoading = true;
      notifyListeners();
      sources = (await getSourcesUseCase.execute(categoryId))!;
      isLoading = false;
      notifyListeners();
    } catch (e) {
      errorMessage = e.toString();
      notifyListeners();
    }
  }
}