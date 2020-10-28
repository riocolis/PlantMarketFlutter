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

  User(
      {this.id,
      this.name,
      this.email,
      this.address,
      this.houseNumber,
      this.phoneNumber,
      this.city,
      this.pictureUrl});

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
