import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_c15/data/model/article.dart';
import 'package:news_c15/ui/utils/extensions.dart';
import 'package:news_c15/ui/widgets/loading_view.dart';

class ArticleWidget extends StatelessWidget {
  final Article article;

  const ArticleWidget({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(color: context.secondary),
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: article.urlToImage ?? "",
            placeholder: (_, __) => LoadingView(),
            errorWidget: (_, __, ___) => Icon(Icons.error),
            height: context.height * .25,
          ),
          Text(
            article.title ?? "Unknown",
            style: context.textTheme.titleSmall!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  "By: ${article.author}",
                  style: context.textTheme.bodySmall,
                ),
              ),
              Text(
                article.publishedAt ?? "",
                style: context.textTheme.bodySmall,
              )
            ],
          )
        ],
      ),
    );
  }
}
