class SrearchModel {
  bool? status;
  String? message;
  int? update;
  List<Products>? products;

  SrearchModel({this.status, this.message, this.update, this.products});

  SrearchModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    update = json['update'];
    if (json['Products'] != null) {
      products = <Products>[];
      json['Products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['update'] = this.update;
    if (this.products != null) {
      data['Products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? id;
  String? name;
  String? oldPrice;
  int? price;
  Null? createdAt;
  String? updatedAt;
  int? discount;
  String? description;
  String? image;
  String? inFavorites;
  String? inCart;

  Products(
      {this.id,
        this.name,
        this.oldPrice,
        this.price,
        this.createdAt,
        this.updatedAt,
        this.discount,
        this.description,
        this.image,
        this.inFavorites,
        this.inCart});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    oldPrice = json['old_price'];
    price = json['price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    discount = json['discount'];
    description = json['description'];
    image = json['image'];
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['old_price'] = this.oldPrice;
    data['price'] = this.price;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['discount'] = this.discount;
    data['description'] = this.description;
    data['image'] = this.image;
    data['in_favorites'] = this.inFavorites;
    data['in_cart'] = this.inCart;
    return data;
  }
}