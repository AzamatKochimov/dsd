import 'dart:convert';
// model for images
ImageModel imageModelFromJson(String str) => ImageModel.fromJson(json.decode(str));

String imageModelToJson(ImageModel data) => json.encode(data.toJson());

class ImageModel {
  final bool success;
  final Images images;

  ImageModel({
    required this.success,
    required this.images,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
    success: json["success"],
    images: Images.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": images.toJson(),
  };
}

class Images {
  final int? id;
  final String originalName;
  final String url;

  Images({
    this.id,
    required this.originalName,
    required this.url,
  });

  factory Images.fromJson(Map<String, dynamic> json) => Images(
    id: json["id"],
    originalName: json["originalName"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "originalName": originalName,
    "url": url,
  };
}
