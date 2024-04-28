import 'dart:convert';

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  final bool success;
  final List<Categories> data;

  CategoryModel({
    required this.success,
    required this.data,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    success: json["success"],
    data: List<Categories>.from(json["data"].map((x) => Categories.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Categories {
  final int id;
  final String name;
  final dynamic attachment;
  final List<Categories> categoryDtoList;

  Categories({
    required this.id,
    required this.name,
    required this.attachment,
    required this.categoryDtoList,
  });

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
    id: json["id"],
    name: json["name"],
    attachment: json["attachment"],
    categoryDtoList: List<Categories>.from(json["categoryDTOList"].map((x) => Categories.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "attachment": attachment,
    "categoryDTOList": List<dynamic>.from(categoryDtoList.map((x) => x.toJson())),
  };
}
