class DataModel {
  String name;
  String img;
  String location;
  String description;
  int price;
  int people;
  int stars;

  DataModel({
    required this.name,
    required this.img,
    required this.location,
    required this.description,
    required this.price,
    required this.people,
    required this.stars,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
        name: json['name'],
        img: json['img'],
        location: json['location'],
        description: json['description'],
        price: json['price'],
        people: json['people'],
        stars: json['stars']);
  }
}
