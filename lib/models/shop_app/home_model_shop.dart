// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

HomeModel welcomeFromJson(String str) => HomeModel.fromJson(json.decode(str));

String welcomeToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  HomeModel({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  Data data;

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.banners,
    required this.products,
  });

  List<Banner> banners;
  List<Product> products;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    banners: List<Banner>.from(json["banners"].map((x) => Banner.fromJson(x))),
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "banners": List<dynamic>.from(banners.map((x) => x.toJson())),
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
  };
}

class Banner {
  Banner({
    required this.id,
    required this.image,
    this.category,
    this.product,
  });

  int id;
  String image;
  dynamic category;
  dynamic product;

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
    id: json["id"],
    image: json["image"],
    category: json["category"],
    product: json["product"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "category": category,
    "product": product,
  };
}

class Product {
  Product({
    required this.id,
    required this.name,
    required this.oldPrice,
    required this.price,
    this.createdAt,
    this.updatedAt,
    required this.discount,
    required this.description,
    required this.image,
    required this.inFavorites,
    required this.inCart,
    required this.images,
  });

  int id;
  String name;
  String oldPrice;
  int price;
  dynamic createdAt;
  dynamic updatedAt;
  int discount;
  String description;
  String image;
  String inFavorites;
  String inCart;
  List<Image> images;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    oldPrice: json["old_price"],
    price: json["price"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    discount: json["discount"],
    description: json["description"],
    image: json["image"],
    inFavorites: json["in_favorites"],
    inCart: json["in_cart"],
    images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "old_price": oldPrice,
    "price": price,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "discount": discount,
    "description": description,
    "image": image,
    "in_favorites": inFavorites,
    "in_cart": inCart,
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
  };
}

class Image {
  Image({
    required this.id,
    required this.productsId,
    required this.images,
  });

  int id;
  int productsId;
  String images;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    id: json["id"],
    productsId: json["products_id"],
    images: json["images"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "products_id": productsId,
    "images": images,
  };
}
