// To parse this JSON data, do
//
//     final productModelSardor = productModelSardorFromJson(jsonString);

import 'dart:convert';

List<ProductModelSardor> productModelSardorFromJson(String str) => List<ProductModelSardor>.from(json.decode(str).map((x) => ProductModelSardor.fromJson(x)));

String productModelSardorToJson(List<ProductModelSardor> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModelSardor {
    int id;
    String productName;
    double price;
    TCategory productCategory;
    bool availability;
    String payType;
    String conditionProduct;
    String description;
    Seller seller;
    List<Attachment> attachment;
    List<ProductDtoList> productDtoLists;

    ProductModelSardor({
        required this.id,
        required this.productName,
        required this.price,
        required this.productCategory,
        required this.availability,
        required this.payType,
        required this.conditionProduct,
        required this.description,
        required this.seller,
        required this.attachment,
        required this.productDtoLists,
    });

    factory ProductModelSardor.fromJson(Map<String, dynamic> json) => ProductModelSardor(
        id: json["id"],
        productName: json["productName"],
        price: json["price"],
        productCategory: TCategory.fromJson(json["productCategory"]),
        availability: json["availability"],
        payType: json["payType"],
        conditionProduct: json["conditionProduct"],
        description: json["description"],
        seller: Seller.fromJson(json["seller"]),
        attachment: List<Attachment>.from(json["attachment"].map((x) => Attachment.fromJson(x))),
        productDtoLists: List<ProductDtoList>.from(json["productDTOLists"].map((x) => ProductDtoList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "productName": productName,
        "price": price,
        "productCategory": productCategory.toJson(),
        "availability": availability,
        "payType": payType,
        "conditionProduct": conditionProduct,
        "description": description,
        "seller": seller.toJson(),
        "attachment": List<dynamic>.from(attachment.map((x) => x.toJson())),
        "productDTOLists": List<dynamic>.from(productDtoLists.map((x) => x.toJson())),
    };
}

class Attachment {
    int id;
    String name;
    String contentType;
    String contentUrl;
    int size;

    Attachment({
        required this.id,
        required this.name,
        required this.contentType,
        required this.contentUrl,
        required this.size,
    });

    factory Attachment.fromJson(Map<String, dynamic> json) => Attachment(
        id: json["id"],
        name: json["name"],
        contentType: json["contentType"],
        contentUrl: json["contentURL"],
        size: json["size"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "contentType": contentType,
        "contentURL": contentUrl,
        "size": size,
    };
}

class TCategory {
    DateTime createdAt;
    DateTime updatedAt;
    bool deleted;
    dynamic createdById;
    dynamic updatedById;
    int id;
    String name;
    TCategory? parentCategory;
    dynamic attachment;

    TCategory({
        required this.createdAt,
        required this.updatedAt,
        required this.deleted,
        required this.createdById,
        required this.updatedById,
        required this.id,
        required this.name,
        required this.parentCategory,
        required this.attachment,
    });

    factory TCategory.fromJson(Map<String, dynamic> json) => TCategory(
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deleted: json["deleted"],
        createdById: json["createdById"],
        updatedById: json["updatedById"],
        id: json["id"],
        name: json["name"],
        parentCategory: json["parentCategory"] == null ? null : TCategory.fromJson(json["parentCategory"]),
        attachment: json["attachment"],
    );

    Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deleted": deleted,
        "createdById": createdById,
        "updatedById": updatedById,
        "id": id,
        "name": name,
        "parentCategory": parentCategory?.toJson(),
        "attachment": attachment,
    };
}

class ProductDtoList {
    int id;
    ProductFeatureName productFeatureName;
    dynamic productFutureValue;
    String value;

    ProductDtoList({
        required this.id,
        required this.productFeatureName,
        required this.productFutureValue,
        required this.value,
    });

    factory ProductDtoList.fromJson(Map<String, dynamic> json) => ProductDtoList(
        id: json["id"],
        productFeatureName: ProductFeatureName.fromJson(json["productFeatureName"]),
        productFutureValue: json["productFutureValue"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "productFeatureName": productFeatureName.toJson(),
        "productFutureValue": productFutureValue,
        "value": value,
    };
}

class ProductFeatureName {
    int id;
    String name;
    String measure;
    dynamic categoryId;

    ProductFeatureName({
        required this.id,
        required this.name,
        required this.measure,
        required this.categoryId,
    });

    factory ProductFeatureName.fromJson(Map<String, dynamic> json) => ProductFeatureName(
        id: json["id"],
        name: json["name"],
        measure: json["measure"],
        categoryId: json["categoryId"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "measure": measure,
        "categoryId": categoryId,
    };
}

class Seller {
    int id;
    String firstName;
    String lastName;
    String phoneNumber;
    String email;
    Address? address;
    dynamic attachment;

    Seller({
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.phoneNumber,
        required this.email,
        required this.address,
        required this.attachment,
    });

    factory Seller.fromJson(Map<String, dynamic> json) => Seller(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        address: json["address"] == null ? null : Address.fromJson(json["address"]),
        attachment: json["attachment"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "phoneNumber": phoneNumber,
        "email": email,
        "address": address?.toJson(),
        "attachment": attachment,
    };
}

class Address {
    DateTime createdAt;
    DateTime updatedAt;
    bool deleted;
    dynamic createdById;
    dynamic updatedById;
    int id;
    String country;
    String region;

    Address({
        required this.createdAt,
        required this.updatedAt,
        required this.deleted,
        required this.createdById,
        required this.updatedById,
        required this.id,
        required this.country,
        required this.region,
    });

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deleted: json["deleted"],
        createdById: json["createdById"],
        updatedById: json["updatedById"],
        id: json["id"],
        country: json["country"],
        region: json["region"],
    );

    Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deleted": deleted,
        "createdById": createdById,
        "updatedById": updatedById,
        "id": id,
        "country": country,
        "region": region,
    };
}
