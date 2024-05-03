
import 'dart:convert';

ProductModelForCreating productModelFromJson(String str) => ProductModelForCreating.fromJson(json.decode(str));

String productModelToJson(ProductModelForCreating data) => json.encode(data.toJson());

class ProductModelForCreating {
  final String productName;
  final double price;
  final int productCategory;
  final bool availability;
  final String payType;
  final String conditionProduct;
  final String description;
  final int sellerId;
  final List<int> attachmentIds;
  final List<dynamic> productFeaturesDtos;

  ProductModelForCreating({
    required this.productName,
    required this.price,
    required this.productCategory,
    required this.availability,
    required this.payType,
    required this.conditionProduct,
    required this.description,
    required this.sellerId,
    required this.attachmentIds,
    required this.productFeaturesDtos,
  });

  factory ProductModelForCreating.fromJson(Map<String, dynamic> json) => ProductModelForCreating(
    productName: json["productName"],
    price: json["price"],
    productCategory: json["productCategory"],
    availability: json["availability"],
    payType: json["payType"],
    conditionProduct: json["conditionProduct"],
    description: json["description"],
    sellerId: json["sellerId"],
    attachmentIds: List<int>.from(json["attachmentIds"].map((x) => x)),
    productFeaturesDtos: List<dynamic>.from(json["productFeaturesDTOS"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "productName": productName,
    "price": price,
    "productCategory": productCategory,
    "availability": availability,
    "payType": payType,
    "conditionProduct": conditionProduct,
    "description": description,
    "sellerId": sellerId,
    "attachmentIds": List<int>.from(attachmentIds.map((x) => x)),
    "productFeaturesDTOS": List.from(productFeaturesDtos.map((x) => x)),
  };
}
