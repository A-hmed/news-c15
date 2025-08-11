import 'package:flutter/material.dart';
import 'package:news_c15/ui/utils/app_routes.dart';
import 'package:news_c15/ui/utils/extensions.dart';
import 'package:news_c15/ui/widgets/app_scaffold.dart';

import '../../model/category_dm.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var categories = CategoryDM.getCategories(context.themeProvider.isDarkMode);
    return AppScaffold(
        title: "Home",
        body: Container(
          padding: EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Column(
            children: [
              Text(
                "Good Morning Here is Some News For You",
                style: context.textTheme.titleLarge,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: categories.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: (){
                        Navigator.push(context, AppRoutes.news(categories[index]));
                      },
                      child: Container(
                            height: context.height * .23,
                            margin: EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage(categories[index].imagePath)),
                                borderRadius: BorderRadius.circular(24)),
                            child: index.isEven
                                ? buildEvenCategory(
                                    context, categories[index].title)
                                : buildOddCategory(
                                    context, categories[index].title),
                          ),
                    )),
              )
            ],
          ),
        ));
  }

  Widget buildEvenCategory(BuildContext context, String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            Spacer(),
            Expanded(
                child: Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: context.textTheme.titleMedium,
              ),
            )),
          ],
        ),
        Row(
          children: [
            Spacer(),
            Expanded(
                child: Center(
              child: Container(
                decoration: BoxDecoration(
                    color: context.primary.withValues(alpha: .5),
                    borderRadius: BorderRadius.circular(64)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "View All",
                      style: context.textTheme.titleLarge,
                    ),
                    CircleAvatar(
                        backgroundColor: context.primary,
                        child: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: context.secondary,
                        ))
                  ],
                ),
              ),
            )),
          ],
        ),
      ],
    );
  }

  Widget buildOddCategory(BuildContext context, String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [

            Expanded(
                child: Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: context.textTheme.titleMedium,
              ),
            )),
            Spacer(),
          ],
        ),
        Row(
          children: [

            Expanded(
                child: Center(
              child: Container(
                decoration: BoxDecoration(
                    color: context.primary.withValues(alpha: .5),
                    borderRadius: BorderRadius.circular(64)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                        backgroundColor: context.primary,
                        child: Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: context.secondary,
                        )),
                    Text(
                      "View All",
                      style: context.textTheme.titleLarge,
                    ),
                  
                  ],
                ),
              ),
            )),
            Spacer(),
          ],
        ),
      ],
    );
  }
}
