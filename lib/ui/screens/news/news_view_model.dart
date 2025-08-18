import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_c15/domain/model/source.dart';
import 'package:news_c15/domain/usecases/get_sources_usecase.dart';

///SoliD
///State Holder
class NewsViewModel extends Cubit<NewsState> {
  GetSourcesByCategoryUseCase getSourcesUseCase;
  NewsViewModel(this.getSourcesUseCase) : super(NewsState.initial());

  loadSources(String categoryId) async {
    try {
      // isLoading = true;
      // notifyListeners();
      emit(NewsState(sources: [], isLoading: true, errorMessage: ""));
      var sources = (await getSourcesUseCase.execute(categoryId))!;
      // isLoading = false;
      // notifyListeners();
      emit(NewsState(sources: sources, isLoading: false, errorMessage: ""));
    } catch (e) {
      // errorMessage = e.toString();
      // notifyListeners();
      emit(
          NewsState(sources: [], isLoading: false, errorMessage: e.toString()));
    }
  }
}

class NewsState {
  List<Source> sources = [];
  var isLoading = false;
  var errorMessage = "";

  NewsState(
      {required this.sources,
      required this.isLoading,
      required this.errorMessage});

  NewsState.initial(
      {this.sources = const [],
      this.isLoading = false,
      this.errorMessage = ""});
}
