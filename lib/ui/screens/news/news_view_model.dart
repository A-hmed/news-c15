import 'package:flutter/material.dart';
import 'package:news_c15/data/api_manager.dart';
import 'package:news_c15/data/model/source.dart';
import 'package:news_c15/data/repositories/news_repository.dart';

///State Holder
class NewsViewModel extends ChangeNotifier{
  NewsRepository newsRepository;
  NewsViewModel(this.newsRepository);

  List<Source> sources = [];
  var isLoading = false;
  var errorMessage = "";

  loadSources(String categoryId) async{
    try {
      isLoading = true;
      notifyListeners();
      sources = (await newsRepository.loadSources(categoryId))!;
      isLoading = false;
      notifyListeners();
    }catch(e){
      errorMessage = e.toString();
      notifyListeners();
    }
  }
}