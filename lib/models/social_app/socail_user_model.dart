class SocialUserModel
{
   late String email;
   late String phone;
   late String name;
   late String uId;
   late String image;
   late String cover;
   late String bio;
   late bool isEmailVerified;

   SocialUserModel({
   required this.email,
   required this.phone,
   required this.name,
   required this.uId,
   required this.image,
   required this.cover,
   required this.bio,
 required  this.isEmailVerified,
   });

   SocialUserModel.fromJson(Map<String, dynamic> json){

      name = json['name'];
      email = json['email'];
      phone = json['phone'];
      uId = json['uId'];
      image = json['image'];
      cover = json['cover'];
      bio = json['bio'];
      isEmailVerified = json['isEmailVerified'];

      /*  data = (json['data'] != null ? UserData.fromJson(json['data']) : null)!;*/

   }

   Map<String, dynamic> toMap()
   {
      return {
      'name' : name,
      'email' : email,
      'phone' : phone,
      'image' : image,
      'cover' : cover,
      'bio' : bio,
      'uId' : uId,
      'isEmailVerified' : isEmailVerified,
      };
   }

}