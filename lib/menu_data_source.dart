import 'base_network.dart';

class MenuDataSource {
  static MenuDataSource instance = MenuDataSource();

  Future<Map<String, dynamic>> loadCategories() {
    return BaseNetwork.get("categories.php");
  }

  Future<Map<String, dynamic>> loadMeals() {
    return BaseNetwork.get("filter.php?c=Seafood");
  }

  Future<Map<String, dynamic>> loadDetail() {
    return BaseNetwork.get("lookup.php?i=52772");
  }

  Future<Map<String, dynamic>> loadCategoriesDetail(int categoriesId) {
    String id = categoriesId.toString();
    return BaseNetwork.get("categories.php$categoriesId");
  }

  Future<Map<String, dynamic>> loadMealsDetail(int mealsId) {
    String id = mealsId.toString();
    return BaseNetwork.get("filter.php?c=Seafood$mealsId");
  }

  Future<Map<String, dynamic>> loadDetailMeal(int detailId) {
    String id = detailId.toString();
    return BaseNetwork.get("lookup.php?i=52772$detailId");
  }
}
