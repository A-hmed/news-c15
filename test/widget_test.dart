// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:news_c15/data/api_manager.dart';
import 'package:news_c15/data/model/source_response.dart';
import 'package:news_c15/data/repository/news_repository/data_sources/remote_data_source/news_remote_data_source.dart';
import 'package:news_c15/data/repository/news_repository/data_sources/remote_data_source/news_remote_data_source_impl.dart';
import 'package:news_c15/data/repository/news_repository/news_repository_impl.dart';
import 'package:news_c15/domain/repositories/news_repository.dart';

import 'package:news_c15/main.dart';

void main() {
//   NewsRepository x = NewsRepositoryImpl(newsRemoteDataSource: FakeRemoteDataSource(),
//       newsLocalDataSource: newsLocalDataSource,
//       connectivity: connectivity,
//       mapper: mapper);
// }
// class FakeRemoteDataSource extends NewsRemoteDataSource {
//   @override
//   Future<List<SourceResponse>> loadSources(String category) {
//     return [];
//   }
}