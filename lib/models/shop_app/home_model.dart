
class HomeModel
{
  late bool status;
  late String message;
  late String data;

  late List<dynamic> banners = [];
  late List<dynamic> products = [];

  HomeModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    json['data']['banners'].forEach((element)
    {
      banners.add(element);
    });


    json['data']['products'].forEach((element)
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
class Address{

  late int id ;
  late String image;


  Address({required this.id, required this.image});

  factory Address.fromJson(Map<String, dynamic> json){

    return Address(
        id: json["id"],
      image: json["image"],

    );
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