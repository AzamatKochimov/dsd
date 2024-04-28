import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  final bool success;
  final String message;
  final List<Datum> data;
  final List<Error> errors;

  ProductModel({
    required this.success,
    required this.message,
    required this.data,
    required this.errors,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    success: json["success"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    errors: List<Error>.from(json["errors"].map((x) => Error.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "errors": List<dynamic>.from(errors.map((x) => x.toJson())),
  };
}

class Datum {
  final int id;
  final String productName;
  final int price;
  final ProductCategory productCategory;
  final bool availability;
  final String payType;
  final String conditionProduct;
  final String description;
  final Seller seller;
  final List<Attachment> attachment;
  final List<ProductDtoList> productDtoLists;

  Datum({
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

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    productName: json["productName"],
    price: json["price"],
    productCategory: ProductCategory.fromJson(json["productCategory"]),
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
  final int id;
  final String name;
  final String contentType;
  final String contentUrl;
  final int size;

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

class ProductCategory {
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool deleted;
  final int createdById;
  final int updatedById;
  final int id;
  final String name;
  final String parentCategory;
  final Attachment attachment;

  ProductCategory({
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

  factory ProductCategory.fromJson(Map<String, dynamic> json) => ProductCategory(
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    deleted: json["deleted"],
    createdById: json["createdById"],
    updatedById: json["updatedById"],
    id: json["id"],
    name: json["name"],
    parentCategory: json["parentCategory"],
    attachment: Attachment.fromJson(json["attachment"]),
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "deleted": deleted,
    "createdById": createdById,
    "updatedById": updatedById,
    "id": id,
    "name": name,
    "parentCategory": parentCategory,
    "attachment": attachment.toJson(),
  };
}

class ProductDtoList {
  final ProductFeatureName productFeatureName;
  final ProductFutureValue productFutureValue;
  final String value;

  ProductDtoList({
    required this.productFeatureName,
    required this.productFutureValue,
    required this.value,
  });

  factory ProductDtoList.fromJson(Map<String, dynamic> json) => ProductDtoList(
    productFeatureName: ProductFeatureName.fromJson(json["productFeatureName"]),
    productFutureValue: ProductFutureValue.fromJson(json["productFutureValue"]),
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "productFeatureName": productFeatureName.toJson(),
    "productFutureValue": productFutureValue.toJson(),
    "value": value,
  };
}

class ProductFeatureName {
  final int id;
  final String name;
  final String measure;
  final int categoryId;

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

class ProductFutureValue {
  final String value;

  ProductFutureValue({
    required this.value,
  });

  factory ProductFutureValue.fromJson(Map<String, dynamic> json) => ProductFutureValue(
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
  };
}

class Seller {
  final int id;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final Address address;
  final Attachment attachment;

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
    address: Address.fromJson(json["address"]),
    attachment: Attachment.fromJson(json["attachment"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstName": firstName,
    "lastName": lastName,
    "phoneNumber": phoneNumber,
    "email": email,
    "address": address.toJson(),
    "attachment": attachment.toJson(),
  };
}

class Address {
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool deleted;
  final int createdById;
  final int updatedById;
  final int id;
  final String country;
  final String region;

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

class Error {
  final int status;
  final String msg;
  final String field;

  Error({
    required this.status,
    required this.msg,
    required this.field,
  });

  factory Error.fromJson(Map<String, dynamic> json) => Error(
    status: json["status"],
    msg: json["msg"],
    field: json["field"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "field": field,
  };
}
