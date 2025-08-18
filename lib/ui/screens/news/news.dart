import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:news_c15/data/api_manager.dart';
import 'package:news_c15/data/mappers/source_mapper.dart';
import 'package:news_c15/data/repository/news_repository/data_sources/local_data_source/news_local_data_source.dart';
import 'package:news_c15/data/repository/news_repository/data_sources/local_data_source/news_local_data_source_impl.dart';
import 'package:news_c15/data/repository/news_repository/data_sources/remote_data_source/news_remote_data_source.dart';
import 'package:news_c15/data/repository/news_repository/data_sources/remote_data_source/news_remote_data_source_impl.dart';
import 'package:news_c15/data/repository/news_repository/news_repository_impl.dart';
import 'package:news_c15/data/repository/news_repository/news_repository_impl2.dart';
import 'package:news_c15/di/configure_dependcies.dart';
import 'package:news_c15/domain/repositories/news_repository.dart';
import 'package:news_c15/domain/model/source.dart';
import 'package:news_c15/domain/usecases/load_articles_by_source.dart';
import 'package:news_c15/ui/model/category_dm.dart';
import 'package:news_c15/ui/screens/news/news_viewmodel.dart';
import 'package:news_c15/ui/utils/extensions.dart';
import 'package:news_c15/ui/widgets/app_scaffold.dart';
import 'package:news_c15/ui/widgets/error_view.dart';
import 'package:news_c15/ui/widgets/loading_view.dart';
import 'package:provider/provider.dart';

import 'news_list.dart';

class News extends StatefulWidget {
  final CategoryDM categoryDM;

  const News({super.key, required this.categoryDM});

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
        child: Builder(builder: (context) {
          return AppScaffold(
              title: widget.categoryDM.title,
              body: Consumer<NewsViewModel>(
                builder: (context, viewModel, _) {
                  if (viewModel.error.isNotEmpty) {
                    return ErrorView(message: viewModel.error);
                  } else if (viewModel.sources.isNotEmpty) {
                    var sources = viewModel.sources;
                    return buildTabView(context, sources);
                  } else {
                    return LoadingView();
                  }
                },
              ));
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
            Expanded(
                child: TabBarView(
                    children: sources
                        .map((source) => NewsList(source: source))
                        .toList()))
          ],
        ));
  }

  Widget mapSourceToTab(Source source) {
    return Tab(text: source.name);
  }
}
