class Location {
  final String name;
  final String city;
  final String imageURL;
  final int price;

  Location(this.name, this.city, this.imageURL, this.price);

  factory Location.fromJson(Map<String, dynamic> json) {
    return new Location(
      json["name"],
      json["city"],
      json["imageURL"],
      json["price"]
    );
  }
}
