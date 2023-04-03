

 class UserDetailsModel{
  String ? displayName;
  String ? email;
  String ? photoUrl;

  UserDetailsModel({this.displayName, this.email, this.photoUrl});

  UserDetailsModel.fromJson(Map<String,dynamic>json)
  {
   displayName = json["displayName"];
   displayName = json["email"];
   displayName = json["photoUrl"];
  }


   Map<String,dynamic> toJson()
   {
    final Map<String,dynamic> data = <String,dynamic>{};
    data["displayName"] = displayName;
    data["email"] = email;
    data["photoUrl"] = photoUrl;
    return  data;
   }

}