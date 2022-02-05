

class ChangeFavoritesModel {

 late int update;
 late bool status;
 late String?  message;
  /* late UserData data;*/

 ChangeFavoritesModel.fromJson(Map<String, dynamic> json){
   status = json['status'];
    message = json['message'];
   update = json['update'];

    /*  data = (json['data'] != null ? UserData.fromJson(json['data']) : null)!;*/

  }
}

