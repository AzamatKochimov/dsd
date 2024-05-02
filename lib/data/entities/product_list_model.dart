import 'dart:convert';

ProductListModel productListModelFromJson(String str) =>
    ProductListModel.fromJson(json.decode(str));

String productListModelToJson(ProductListModel data) =>
    json.encode(data.toJson());

class ProductListModel {
  bool? success;
  List<Datum>? data;

  ProductListModel({
    this.success,
    this.data,
  });

  factory ProductListModel.fromJson(Map<String, dynamic> json) {
    return ProductListModel(
      success: json["success"],
      data: json["data"] != null
          ? List<Datum>.from(json["data"].map((x) => Datum.fromJson(x)))
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  int? id;
  String productName;
  int price;
  TCategory? productCategory;
  bool? availability;
  PayType? payType;
  ConditionProduct? conditionProduct;
  String description;
  Seller? seller;
  List<Attachment> attachment;
  List<ProductDtoList>? productDtoLists;

  Datum({
    this.id,
    required this.productName,
    required this.price,
    this.productCategory,
    this.availability,
    this.payType,
    this.conditionProduct,
    required this.description,
    this.seller,
    required this.attachment,
    this.productDtoLists,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        productName: json["productName"],
        price: json["price"],
        productCategory: TCategory.fromJson(json["productCategory"]),
        availability: json["availability"],
        payType: payTypeValues.map[json["payType"]],
        conditionProduct: conditionProductValues.map[json["conditionProduct"]],
        description: json["description"],
        seller: Seller.fromJson(json["seller"]),
        attachment: List<Attachment>.from(
            json["attachment"].map((x) => Attachment.fromJson(x))),
        productDtoLists: List<ProductDtoList>.from(
            json["productDTOLists"].map((x) => ProductDtoList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "productName": productName,
        "price": price,
        "productCategory": productCategory?.toJson(),
        "availability": availability,
        "payType": payTypeValues.reverse[payType],
        "conditionProduct": conditionProductValues.reverse[conditionProduct],
        "description": description,
        "seller": seller!.toJson(),
        "attachment": List<dynamic>.from(attachment.map((x) => x.toJson())),
        "productDTOLists":
            List<dynamic>.from(productDtoLists!.map((x) => x.toJson())),
      };
}

class Attachment {
  int? id;
  String? name;
  String? contentType;
  String? contentUrl;
  int? size;

  Attachment({
    this.id,
    this.name,
    this.contentType,
    this.contentUrl,
    this.size,
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

enum ConditionProduct { NEW }

final conditionProductValues = EnumValues({"NEW": ConditionProduct.NEW});

enum PayType { USD }

final payTypeValues = EnumValues({"USD": PayType.USD});

class TCategory {
  DateTime? createdAt;
  DateTime? updatedAt;
  bool? deleted;
  dynamic createdById;
  dynamic updatedById;
  int? id;
  Name? name;
  TCategory? parentCategory;
  dynamic attachment;

  TCategory({
    this.createdAt,
    this.updatedAt,
    this.deleted,
    this.createdById,
    this.updatedById,
    this.id,
    this.name,
    this.parentCategory,
    this.attachment,
  });

  factory TCategory.fromJson(Map<String, dynamic> json) => TCategory(
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deleted: json["deleted"],
        createdById: json["createdById"],
        updatedById: json["updatedById"],
        id: json["id"],
        name: nameValues.map[json["name"]],
        parentCategory: TCategory.fromJson(json["parentCategory"]),
        attachment: json["attachment"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "deleted": deleted,
        "createdById": createdById,
        "updatedById": updatedById,
        "id": id,
        "name": nameValues.reverse[name],
        "parentCategory": parentCategory!.toJson(),
        "attachment": attachment,
      };
}

enum Name { ELECTRONICS, FOOD_BEVERAGES, HOME_GARDEN, INTELLIGENT_CONCRETE_CAR }

final nameValues = EnumValues({
  "Electronics": Name.ELECTRONICS,
  "Food & Beverages": Name.FOOD_BEVERAGES,
  "Home & Garden": Name.HOME_GARDEN,
  "Intelligent Concrete Car": Name.INTELLIGENT_CONCRETE_CAR
});

class ProductDtoList {
  int? id;
  ProductFeatureName? productFeatureName;
  dynamic productFutureValue;
  String? value;

  ProductDtoList({
    this.id,
    this.productFeatureName,
    this.productFutureValue,
    this.value,
  });

  factory ProductDtoList.fromJson(Map<String, dynamic> json) => ProductDtoList(
        id: json["id"],
        productFeatureName:
            ProductFeatureName.fromJson(json["productFeatureName"]),
        productFutureValue: json["productFutureValue"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "productFeatureName": productFeatureName?.toJson(),
        "productFutureValue": productFutureValue,
        "value": value,
      };
}

class ProductFeatureName {
  int? id;
  String? name;
  String? measure;
  dynamic categoryId;

  ProductFeatureName({
    this.id,
    this.name,
    this.measure,
    this.categoryId,
  });

  factory ProductFeatureName.fromJson(Map<String, dynamic> json) =>
      ProductFeatureName(
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
  int? id;
  FirstName? firstName;
  LastName? lastName;
  String? phoneNumber;
  Email? email;
  Address? address;
  dynamic attachment;

  Seller({
    this.id,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.email,
    this.address,
    this.attachment,
  });

  factory Seller.fromJson(Map<String, dynamic> json) => Seller(
        id: json["id"],
        firstName: firstNameValues.map[json["firstName"]],
        lastName: lastNameValues.map[json["lastName"]],
        phoneNumber: json["phoneNumber"],
        email: emailValues.map[json["email"]],
        address: Address.fromJson(json["address"]),
        attachment: json["attachment"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstNameValues.reverse[firstName],
        "lastName": lastNameValues.reverse[lastName],
        "phoneNumber": phoneNumber,
        "email": emailValues.reverse[email],
        "address": address?.toJson(),
        "attachment": attachment,
      };
}

class Address {
  DateTime? createdAt;
  DateTime? updatedAt;
  bool? deleted;
  dynamic createdById;
  dynamic updatedById;
  int? id;
  Country? country;
  Region? region;

  Address({
    this.createdAt,
    this.updatedAt,
    this.deleted,
    this.createdById,
    this.updatedById,
    this.id,
    this.country,
    this.region,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deleted: json["deleted"],
        createdById: json["createdById"],
        updatedById: json["updatedById"],
        id: json["id"],
        country: countryValues.map[json["country"]],
        region: regionValues.map[json["region"]],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "deleted": deleted,
        "createdById": createdById,
        "updatedById": updatedById,
        "id": id,
        "country": countryValues.reverse[country],
        "region": regionValues.reverse[region],
      };
}

enum Country { UZBEKISTAN }

final countryValues = EnumValues({"UZBEKISTAN": Country.UZBEKISTAN});

enum Region { BERLIN }

final regionValues = EnumValues({"Berlin": Region.BERLIN});

enum Email { NO0404_IR_GMAIL_COM }

final emailValues =
    EnumValues({"no0404ir@gmail.com": Email.NO0404_IR_GMAIL_COM});

enum FirstName { ADMIN }

final firstNameValues = EnumValues({"Admin": FirstName.ADMIN});

enum LastName { ADMINOV }

final lastNameValues = EnumValues({"Adminov": LastName.ADMINOV});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
