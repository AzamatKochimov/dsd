class ProductListModel {
  int id;
  String productName;
  int price;
  ProductCategory productCategory;
  bool availability;
  String payType;
  String conditionProduct;
  String description;
  Seller seller;
  List<Attachment> attachment;
  List<ProductDtoList> productDtoLists;

  ProductListModel({
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
}

class ProductCategory {
  DateTime createdAt;
  DateTime updatedAt;
  bool deleted;
  int createdById;
  int updatedById;
  int id;
  String name;
  String parentCategory;
  Attachment attachment;

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
}

class ProductDtoList {
  int id;
  ProductFeatureName productFeatureName;
  ProductFutureValue productFutureValue;
  String value;

  ProductDtoList({
    required this.id,
    required this.productFeatureName,
    required this.productFutureValue,
    required this.value,
  });
}

class ProductFeatureName {
  int id;
  String name;
  String measure;
  int categoryId;

  ProductFeatureName({
    required this.id,
    required this.name,
    required this.measure,
    required this.categoryId,
  });
}

class ProductFutureValue {
  String value;

  ProductFutureValue({
    required this.value,
  });
}

class Seller {
  int id;
  String firstName;
  String lastName;
  String phoneNumber;
  String email;
  Address address;
  Attachment attachment;

  Seller({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.address,
    required this.attachment,
  });
}

class Address {
  DateTime createdAt;
  DateTime updatedAt;
  bool deleted;
  int createdById;
  int updatedById;
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
}
