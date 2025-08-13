import 'package:flutter/material.dart';
import 'package:news_c15/data/api_manager.dart';
import 'package:news_c15/data/model/source.dart';

class NewsViewModel extends ChangeNotifier{

  List<Source> sources = [];
  var isLoading = false;
  var errorMessage = "";

  loadSources(String categoryId) async{
    try {
      isLoading = true;
      notifyListeners();
      sources = (await ApiManager.instance.loadSources(categoryId))!;
      isLoading = false;
      notifyListeners();
    }catch(e){
      errorMessage = e.toString();
      notifyListeners();
    }
  }
}