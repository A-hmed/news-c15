import 'package:flutter/material.dart';
import 'package:news_c15/data/api_manager.dart';
import 'package:news_c15/data/model/source.dart';
import 'package:news_c15/data/repository/news_repository/news_repository.dart';

class NewsViewModel extends ChangeNotifier {
  NewsRepository repository;
  NewsViewModel(this.repository);
  var isLoading = false;
  var error = "";
  List<Source> sources = [];

  Future<void> loadSources(String category) async {
    isLoading = true;
    notifyListeners();
    try {
      sources = await repository.loadSources(category);
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      error = e.toString();
      notifyListeners();
    }
  }
}