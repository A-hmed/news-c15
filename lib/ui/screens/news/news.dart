import 'package:flutter/material.dart';
import 'package:news_c15/data/api_manager.dart';
import 'package:news_c15/data/model/source.dart';
import 'package:news_c15/ui/utils/extensions.dart';
import 'package:news_c15/ui/widgets/app_scaffold.dart';
import 'package:news_c15/ui/widgets/error_view.dart';
import 'package:news_c15/ui/widgets/loading_view.dart';

import 'news_list.dart';

class News extends StatelessWidget {
  const News({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        title: "General",
        body: FutureBuilder(
            future: ApiManager().getSources(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                var error = snapshot.error;
                return ErrorView(message: error.toString());
              } else if (snapshot.hasData) {
                var sources = snapshot.data!;
                return buildTabView(context,sources);
              } else {
                return LoadingView();
              }
            }));
  }

  Widget buildTabView(BuildContext context, List<Source> sources) {
    return DefaultTabController(
        length: sources.length,
        child: Column(
          children: [
            TabBar(
              tabs: sources.map(mapSourceToTab).toList(),
              isScrollable: true,
              labelStyle: context.textTheme.titleSmall!
                  .copyWith(fontWeight: FontWeight.bold),
              unselectedLabelStyle: context.textTheme.bodyLarge,
              indicatorColor: context.secondary,
              dividerColor: Colors.transparent,
              tabAlignment: TabAlignment.start,
            ),
            Expanded(child: TabBarView(children: sources.map((source)=> NewsList(source: source)).toList()))
          ],
        ));
  }

  Widget mapSourceToTab(Source source) {
    return Tab(text: source.name);
  }
}
