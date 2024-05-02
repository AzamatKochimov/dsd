// To parse this JSON data, do
//
//     final ProductModelSardor = ProductModelSardorFromJson(jsonString);

import 'dart:convert';

List<ProductModelSardor> ProductModelSardorFromJson(String str) => List<ProductModelSardor>.from(json.decode(str).map((x) => ProductModelSardor.fromJson(x)));

String ProductModelSardorToJson(List<ProductModelSardor> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModelSardor {
    int id;
    String productName;
    double price;
    TCategory productCategory;
    bool availability;
    PayType payType;
    ConditionProduct conditionProduct;
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
        payType: payTypeValues.map[json["payType"]]!,
        conditionProduct: conditionProductValues.map[json["conditionProduct"]]!,
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
        "payType": payTypeValues.reverse[payType],
        "conditionProduct": conditionProductValues.reverse[conditionProduct],
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

enum ConditionProduct {
    NEW
}

final conditionProductValues = EnumValues({
    "NEW": ConditionProduct.NEW
});

enum PayType {
    USD
}

final payTypeValues = EnumValues({
    "USD": PayType.USD
});

class TCategory {
    DateTime createdAt;
    DateTime updatedAt;
    bool deleted;
    dynamic createdById;
    dynamic updatedById;
    int id;
    Name name;
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
        name: nameValues.map[json["name"]]!,
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
        "name": nameValues.reverse[name],
        "parentCategory": parentCategory?.toJson(),
        "attachment": attachment,
    };
}

enum Name {
    ELECTRONICS,
    FOOD_BEVERAGES,
    HOME_GARDEN,
    INTELLIGENT_CONCRETE_CAR
}

final nameValues = EnumValues({
    "Electronics": Name.ELECTRONICS,
    "Food & Beverages": Name.FOOD_BEVERAGES,
    "Home & Garden": Name.HOME_GARDEN,
    "Intelligent Concrete Car": Name.INTELLIGENT_CONCRETE_CAR
});

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
    FirstName firstName;
    LastName lastName;
    String phoneNumber;
    Email email;
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
        firstName: firstNameValues.map[json["firstName"]]!,
        lastName: lastNameValues.map[json["lastName"]]!,
        phoneNumber: json["phoneNumber"],
        email: emailValues.map[json["email"]]!,
        address: json["address"] == null ? null : Address.fromJson(json["address"]),
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
    DateTime createdAt;
    DateTime updatedAt;
    bool deleted;
    dynamic createdById;
    dynamic updatedById;
    int id;
    Country country;
    Region region;

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
        country: countryValues.map[json["country"]]!,
        region: regionValues.map[json["region"]]!,
    );

    Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deleted": deleted,
        "createdById": createdById,
        "updatedById": updatedById,
        "id": id,
        "country": countryValues.reverse[country],
        "region": regionValues.reverse[region],
    };
}

enum Country {
    UZBEKISTAN
}

final countryValues = EnumValues({
    "UZBEKISTAN": Country.UZBEKISTAN
});

enum Region {
    BERLIN
}

final regionValues = EnumValues({
    "Berlin": Region.BERLIN
});

enum Email {
    NO0404_IR_GMAIL_COM,
    ZIKRILLOHAKRAMOV2_GMAIL_COM
}

final emailValues = EnumValues({
    "no0404ir@gmail.com": Email.NO0404_IR_GMAIL_COM,
    "zikrillohakramov2@gmail.com": Email.ZIKRILLOHAKRAMOV2_GMAIL_COM
});

enum FirstName {
    ADMIN,
    Z
}

final firstNameValues = EnumValues({
    "Admin": FirstName.ADMIN,
    "z": FirstName.Z
});

enum LastName {
    A,
    ADMINOV
}

final lastNameValues = EnumValues({
    "a": LastName.A,
    "Adminov": LastName.ADMINOV
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
