import 'package:flutter/material.dart';
import 'package:news_c15/di/get_it_modules.dart';
import 'package:news_c15/domain/model/source.dart';
import 'package:news_c15/ui/model/category_dm.dart';
import 'package:news_c15/ui/screens/news/news_list.dart';
import 'package:news_c15/ui/utils%20/extensions/build_context_extensions.dart';
import 'package:news_c15/ui/widgets%20/app_scaffold.dart';
import 'package:news_c15/ui/widgets%20/error_view.dart';
import 'package:news_c15/ui/widgets%20/loading_view.dart';
import 'package:provider/provider.dart';

import 'news_view_model.dart';

class News extends StatefulWidget {
  CategoryDM categoryDM;

  News({super.key, required this.categoryDM});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  late NewsViewModel viewModel = getIt();

  @override
  void initState() {
    super.initState();
    viewModel.loadSources(widget.categoryDM.id);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => viewModel,
        child: AppScaffold(
            body: Consumer<NewsViewModel>(builder: (context, _, __) {
              if (viewModel.errorMessage.isNotEmpty) {
                return ErrorView(message: viewModel.errorMessage);
              } else if (viewModel.sources.isNotEmpty) {
                return buildTabsList(context, viewModel.sources);
              } else {
                return Center(child: LoadingView());
              }
            }),
            appBarTitle: widget.categoryDM.id));
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
