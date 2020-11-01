part of 'models.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String email;
  final String address;
  final String houseNumber;
  final String phoneNumber;
  final String city;
  final String pictureUrl;
  static String token;

  User({
    this.id,
    this.name,
    this.email,
    this.address,
    this.houseNumber,
    this.phoneNumber,
    this.city,
    this.pictureUrl,
  });

  User copyWith({
    int id,
    String name,
    String email,
    String address,
    String houseNumber,
    String phoneNumber,
    String city,
    String pictureUrl,
  }) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        address: address ?? this.address,
        houseNumber: houseNumber ?? this.houseNumber,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        city: city ?? this.city,
        pictureUrl: pictureUrl ?? this.pictureUrl,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        address: json["address"] == null ? null : json["address"],
        houseNumber: json["houseNumber"] == null ? null : json["houseNumber"],
        phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
        city: json["city"] == null ? null : json["city"],
        pictureUrl: json["profile_photo_url"] == null
            ? null
            : json["profile_photo_url"],
      );

  @override
  List<Object> get props =>
      [id, name, email, address, houseNumber, phoneNumber, city, pictureUrl];
}

User mockUser = User(
  id: 1,
  name: 'Jennie Kim',
  address: 'Ki Hajar Dewantoro Road',
  city: 'Bandung',
  houseNumber: '113',
  phoneNumber: '+6284003423421',
  email: 'JennieKim@gmail.com',
  pictureUrl: '$imgprofilephoto',
);

List<String> mockAccount = [
  'Edit Profile',
  'Home Address',
  'Security',
  'Payments',
];

List<String> mockAccountFoodMarket = [
  'Rate App',
  'Help Center',
  'Privacy & Policy',
  'Terms & Conditions',
];
