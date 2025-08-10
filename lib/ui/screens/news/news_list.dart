import 'package:flutter/material.dart';
import 'package:news_c15/data/api_manager.dart';
import 'package:news_c15/data/model/article.dart';
import 'package:news_c15/data/model/source.dart';
import 'package:news_c15/ui/widgets/article_widget.dart';
import 'package:news_c15/ui/widgets/loading_view.dart';

import '../../widgets/error_view.dart';

class NewsList extends StatelessWidget {
  final Source source;

  const NewsList({super.key, required this.source});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager().getArticles(source.id ?? ""),
        builder: (context, snapshot){
          if (snapshot.hasError) {
            var error = snapshot.error;
            return ErrorView(message: error.toString());
          } else if (snapshot.hasData) {
            var articles = snapshot.data!;
            return buildArticlesList(articles);
          } else {
            return LoadingView();
          }
        });
  }

  Widget buildArticlesList(List<Article> articles) {
    return Expanded(
      child: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index){
          return ArticleWidget(article: articles[index]);
        },
      ),
    );
  }
}
