class Contractor {
  String uid;
  String image;
  String location;
  String name;
  String price;
  String rating;

  Contractor(
      {this.uid,
      this.image,
      this.location,
      this.name,
      this.price,
      this.rating});
  Contractor.fromMap(Map<String, dynamic> data) {
    uid = data['uid'];
    image = data['image'];
    location = data['location'];
    name = data['name'];
    price = data['price'];
    rating = data['rating'];
  }
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'image': image,
      'location': location,
      'name': name,
      'price': price,
      'rating': rating,
    };
  }
}
