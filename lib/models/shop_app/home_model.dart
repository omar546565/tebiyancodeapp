class HomeModel
{
  late bool status;
  late String message;
  late String data;


  HomeModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];


  }

}

class HomeDataModel{

  List<BannersModel> banners =[];
  List<ProductsModel> products =[];
  HomeDataModel.fromJson(Map<String, dynamic> json)
  {
      json['banners'].forEach((element)
      {
        banners.add(element);
      });
      json['products'].forEach((element)
      {
        products.add(element);
      });
  }
}

class BannersModel {
 late int id ;
 late String image;
  BannersModel.fromJson(Map<String, dynamic> json)
  {
     id = json['id'];
     image = json['image'];
  }
}

class ProductsModel{
  late int id ;
  dynamic price;
  dynamic old_price;
  dynamic discount;
  late String image;
  late String name;
  late bool in_favorites;
  late bool in_cart;


  ProductsModel.fromJson(Map<String, dynamic> json)
  {
    id = json['id'];
    price = json['price'];
    old_price = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    in_favorites = json['in_favorites'];
    in_cart = json['in_cart'];
  }
}