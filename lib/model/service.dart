class Service {
  String uid;
  String image;
  String name;
  Service({this.uid, this.image, this.name});
  Service.fromMap(Map<String, dynamic> data) {
    uid = data['uid'];
    image = data['image'];
    name = data['name'];
  }
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'image': image,
      'name': name,
    };
  }
}
