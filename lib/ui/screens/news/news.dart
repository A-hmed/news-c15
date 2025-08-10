import 'package:flutter/material.dart';
import 'package:news_c15/data/api_manager.dart';
import 'package:news_c15/data/model/source.dart';
import 'package:news_c15/ui/model/category_dm.dart';
import 'package:news_c15/ui/screens/news/news_list.dart';
import 'package:news_c15/ui/utils%20/extensions/build_context_extensions.dart';
import 'package:news_c15/ui/widgets%20/app_scaffold.dart';
import 'package:news_c15/ui/widgets%20/error_view.dart';
import 'package:news_c15/ui/widgets%20/loading_view.dart';

class News extends StatelessWidget {
  CategoryDM categoryDM;
  News({super.key, required this.categoryDM});

  final ApiManager apiManager = ApiManager();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                  future: apiManager.loadSources(categoryDM.id),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      var error = snapshot.error;
                      return ErrorView(message: error.toString());
                    } else if (snapshot.hasData) {
                      var sources = snapshot.data!;
                      return buildTabsList(context, sources);
                    } else {
                      return Expanded(child: Center(child: LoadingView()));
                    }
                  }),
            )
          ],
        ),
        appBarTitle: categoryDM.text);
  }

  Widget buildTabsList(BuildContext context, List<Source> sources) {
    return DefaultTabController(
      length: sources.length,
      child: Column(
        children: [
          TabBar(
              isScrollable: true,
              dividerColor: Colors.transparent,
              labelStyle: context.textTheme.bodyMedium,
              unselectedLabelStyle: context.textTheme.bodySmall,
              tabAlignment: TabAlignment.start,
              indicatorColor: context.secondaryColor,
              tabs: sources.map(mapSourceToTab).toList()),
          Expanded(
              child: TabBarView(
                  children: sources
                      .map((source) => NewsList(source: source))
                      .toList()))
        ],
      ),
    );
  }

  Widget mapSourceToTab(Source source) {
    return Tab(
      text: source.name,
    );
  }
}
