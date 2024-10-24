class CommentsModel {
  String? name;
  String? uId;
  String? image;
  String? dateTime;
  String? comment;

  CommentsModel({
    this.uId,
    this.name,
    this.image,
    this.dateTime,
    this.comment,
  });

  CommentsModel.fromJson(Map<String, dynamic> json) {
    uId = json['uId'];
    name = json['name'];
    image = json['image'];
    dateTime = json['dateTime'];
    comment = json['comment'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'uId': uId,
      'image': image,
      'dateTime': dateTime,
      'comment': comment,
    };
  }
}
