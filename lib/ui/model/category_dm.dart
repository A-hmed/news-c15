import 'package:news_c15/ui/utils/app_assets.dart';

class CategoryDM{
  String imagePath;
  String title;
  String id;

  CategoryDM(this.imagePath, this.id, this.title);

  // business entertainment general health science sports technology
  static List<CategoryDM> getCategories(bool isDark){
    return  [
      CategoryDM(!isDark ? AppAssets.generalDark: AppAssets.generalLight, "general", "General"),
      CategoryDM(!isDark ? AppAssets.businessDark: AppAssets.businessLight, "business", "Business"),
      CategoryDM(!isDark ? AppAssets.sportDark: AppAssets.sportLight, "sports", "Football"),
      CategoryDM(!isDark ? AppAssets.technologyDark: AppAssets.technologyLight, "technology", "Tech"),
      CategoryDM(!isDark ? AppAssets.scienceDark: AppAssets.scienceLight, "science", "Science"),
      CategoryDM(!isDark ? AppAssets.healthDark: AppAssets.healthLight, "health", "Health"),
      CategoryDM(!isDark ? AppAssets.entertainmentDark: AppAssets.entertainmentLight, "entertainment", "Entertainment"),
    ];
  }
  // static List<CategoryDM> categories =
}