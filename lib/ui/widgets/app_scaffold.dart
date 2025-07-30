import 'package:flutter/material.dart';
import 'package:news_c15/ui/utils/app_colors.dart';
import 'package:news_c15/ui/utils/extensions.dart';

class AppScaffold extends StatelessWidget {
  final String title;
  final Widget body;

  const AppScaffold({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return InkWell(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Icon(
              Icons.menu,
              color: context.secondary,
            ),
          );
        }),
        title: Text(title),
        actions: [
          Icon(
            Icons.search,
            color: context.secondary,
          ),
        ],
      ),
      drawer: buildDrawer(context),
      body: body,
    );
  }

  Widget buildDrawer(BuildContext context) => Container(
        width: context.width * .7,
        color: AppColors.black,
        child: Column(
          children: [
            Container(
                height: context.height * .25,
                decoration: BoxDecoration(color: AppColors.white),
                child: Center(
                    child: Text(
                  "News App",
                  style: TextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ))),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  buildDrawerLabel(Icons.home, "Go to home"),
                  SizedBox(
                    height: 12,
                  ),
                  Divider(
                    color: AppColors.white,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  buildDrawerLabel(Icons.brightness_2, "Theme"),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.white),
                        borderRadius: BorderRadius.circular(16)),
                    child: DropdownButton(
                        value: context.themeProvider.currentMode,
                        dropdownColor: AppColors.black,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        isExpanded: true,
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: AppColors.white,
                        ),
                        underline: SizedBox(),
                        items: [
                          DropdownMenuItem(
                              value: ThemeMode.light, child: Text("Light", style: TextStyle(color: AppColors.white, fontSize: 16),)),
                          DropdownMenuItem(
                              value: ThemeMode.dark, child: Text("Dark", style: TextStyle(color: AppColors.white, fontSize: 16)))
                        ],
                        onChanged: (value) {
                          if (value == null) return;
                          context.themeProvider.changeMode(value);
                        }),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Divider(
                    color: AppColors.white,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  buildDrawerLabel(Icons.language, "Language "),
                  SizedBox(
                    height: 12,
                  ),
                  Divider(
                    color: AppColors.white,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                ],
              ),
            )
          ],
        ),
      );

  buildDrawerLabel(IconData icon, String text) => Row(
        children: [
          Icon(
            icon,
            color: AppColors.white,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            text,
            style: TextStyle(
                color: AppColors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          )
        ],
      );
}
