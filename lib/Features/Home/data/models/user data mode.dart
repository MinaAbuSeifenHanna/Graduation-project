class UserModel {
  String? name;
  String? email;
  String? uId;
  String? image;
  String? cover;
  UserModel({
    this.uId,
    this.email,
    this.name,
    this.image,
    this.cover,

  });
  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    uId = json['uId'];
    name = json['username'];
    image = json['profileImage'];
    cover = json['coverImage'];

  }

  Map<String, dynamic> toMap() {
    return {
      'username': name,
      'uId': uId,
      'email': email,
      'profileImage': image,
      'coverImage': cover,


    };
  }
}
