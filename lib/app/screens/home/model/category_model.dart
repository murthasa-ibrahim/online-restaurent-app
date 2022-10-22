import 'dart:convert';

List<CategoryModel> categoryModelFromJson(String str) =>
    List<CategoryModel>.from(
        json.decode(str).map((x) => CategoryModel.fromJson(x)));

class CategoryModel {
  CategoryModel({
    required this.menuCategory,
    required this.menuCategoryId,
    required this.menuCategoryImage,
    required this.nexturl,
    required this.categoryDishes,
  });

  final String menuCategory;
  final String menuCategoryId;
  final String menuCategoryImage;
  final String nexturl;
  final List<CategoryDish> categoryDishes;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        menuCategory: json["menu_category"],
        menuCategoryId: json["menu_category_id"],
        menuCategoryImage: json["menu_category_image"],
        nexturl: json["nexturl"],
        categoryDishes: List<CategoryDish>.from(
            json["category_dishes"].map((x) => CategoryDish.fromJson(x))),
      );
}

class AddonCat {
  AddonCat({
    required this.addonCategory,
    required this.addonCategoryId,
    required this.addonSelection,
    required this.nexturl,
    required this.addons,
  });

  final String addonCategory;
  final String addonCategoryId;
  final int addonSelection;
  final String nexturl;
  final List<CategoryDish> addons;

  factory AddonCat.fromJson(Map<String, dynamic> json) => AddonCat(
        addonCategory: json["addon_category"],
        addonCategoryId: json["addon_category_id"],
        addonSelection: json["addon_selection"],
        nexturl: json["nexturl"],
        addons: List<CategoryDish>.from(
            json["addons"].map((x) => CategoryDish.fromJson(x))),
      );
}

class CategoryDish {
  CategoryDish({
    required this.dishId,
    required this.dishName,
    required this.dishPrice,
    required this.dishImage,
    required this.dishCurrency,
    required this.dishCalories,
    required this.dishDescription,
    required this.dishAvailability,
    required this.dishType,
    required this.nexturl,
    required this.addonCat,
    this.count = 0,
  });

  final String dishId;
  final String dishName;
  final double dishPrice;
  final String dishImage;
  final String? dishCurrency;
  final double dishCalories;
  final String dishDescription;
  final bool dishAvailability;
  final int dishType;
  final String nexturl;
  final List<AddonCat>? addonCat;
  int count;

  factory CategoryDish.fromJson(Map<String, dynamic> json) => CategoryDish(
        dishId: json["dish_id"],
        dishName: json["dish_name"],
        dishPrice: json["dish_price"].toDouble(),
        dishImage: json["dish_image"],
        dishCurrency: json["dish_currency"],
        dishCalories: json["dish_calories"],
        dishDescription: json["dish_description"],
        dishAvailability: json["dish_Availability"],
        dishType: json["dish_Type"],
        nexturl: json["nexturl"] ?? '',
        addonCat: json["addonCat"] == null
            ? null
            : List<AddonCat>.from(
                json["addonCat"].map((x) => AddonCat.fromJson(x))),
      );
}

enum DishCurrency { sar }

final dishCurrencyValues = EnumValues({"SAR": DishCurrency.sar});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
