// // // MODEL
// // import 'dart:convert';
// //
// // CategoryModel categoryNameFromJson(String str) =>
// //     CategoryModel.fromJson(json.decode(str));
// //
// // String categoryNameToJson(CategoryModel data) => json.encode(data.toJson());
// //
// // class CategoryModel {
// //   final String categoryName;
// //   final String id;
// //   final String categoryAdsNumber;
// //   final List<SubCategory> subCategories;
// //
// //   CategoryModel({
// //     required this.categoryName,
// //     required this.id,
// //     required this.categoryAdsNumber,
// //     required this.subCategories,
// //   });
// //
// //   factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
// //     categoryName: json["categoryName"],
// //     id: json["id"],
// //     categoryAdsNumber: json["categoryAdsNumber"],
// //     subCategories: List<SubCategory>.from(
// //         json["subCategories"].map((x) => SubCategory.fromJson(x))),
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "categoryName": categoryName,
// //     "id": id,
// //     "categoryAdsNumber": categoryAdsNumber,
// //     "subCategories":
// //     List<dynamic>.from(subCategories.map((x) => x.toJson())),
// //   };
// // }
// //
// // class SubCategory {
// //   final List<ProductModel> products;
// //
// //   SubCategory({
// //     required this.products,
// //   });
// //
// //   factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
// //     products: List<ProductModel>.from(
// //         json["products"].map((x) => ProductModel.fromJson(x))),
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "products": List<dynamic>.from(products.map((x) => x.toJson())),
// //   };
// // }
// //
// // class ProductModel {
// //   final String productName;
// //   final String productId;
// //   final double price;
// //   final String description;
// //
// //   ProductModel({
// //     required this.productName,
// //     required this.productId,
// //     required this.price,
// //     required this.description,
// //   });
// //
// //   factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
// //     productName: json["productName"],
// //     productId: json["productId"],
// //     price: json["price"]?.toDouble(),
// //     description: json["description"],
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "productName": productName,
// //     "productId": productId,
// //     "price": price,
// //     "description": description,
// //   };
// // }
//
//
// // To parse this JSON data, do
// //
// //     final categoryName = categoryNameFromJson(jsonString);
//
//
// import 'dart:convert';
//
// List<CategoryModel> categoryNameFromJson(String str) => List<CategoryModel>.from(json.decode(str).map((x) => CategoryModel.fromJson(x)));
//
// String categoryNameToJson(List<CategoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class CategoryModel {
//   final String categoryName;
//   final String id;
//   final String categoryAdsNumber;
//   final List<SubcategoryModel> subCategories;
//
//   CategoryModel({
//     required this.categoryName,
//     required this.id,
//     required this.categoryAdsNumber,
//     required this.subCategories,
//   });
//
//   factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
//     categoryName: json["categoryName"],
//     id: json["id"],
//     categoryAdsNumber: json["categoryAdsNumber"],
//     subCategories: List<SubcategoryModel>.from(json["subCategories"].map((x) => SubcategoryModel.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "categoryName": categoryName,
//     "id": id,
//     "categoryAdsNumber": categoryAdsNumber,
//     "subCategories": List<dynamic>.from(subCategories.map((x) => x.toJson())),
//   };
// }
//
// class SubcategoryModel {
//   final String subCategoryName;
//
//   SubcategoryModel({
//     required this.subCategoryName,
//   });
//
//   factory SubcategoryModel.fromJson(Map<String, dynamic> json) => SubcategoryModel(
//     subCategoryName: json["subCategoryName"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "subCategoryName": subCategoryName,
//   };
// }
