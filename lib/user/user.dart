class User {
  String image;
  String name;
  String email;
  String phone;
  String location;

  // Constructor
  User({
    required this.image,
    required this.name,
    required this.email,
    required this.phone,
    required this.location,
  });

  User copy({
    String? imagePath,
    String? name,
    String? phone,
    String? email,
    String? location,
  }) =>
      User(
        image: imagePath ?? image,
        name: name ?? this.name,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        location: location ?? this.location,
      );

  static User fromJson(Map<String, dynamic> json) => User(
    image: json['imagePath'],
    name: json['name'],
    email: json['email'],
    location: json['location'],
    phone: json['phone'],
  );

  Map<String, dynamic> toJson() => {
    'imagePath': image,
    'name': name,
    'email': email,
    'location': location,
    'phone': phone,
  };
}
