part of 'models.dart';

enum PlantType { new_plants, popular, recommended }

class Plant extends Equatable {
  final int id;
  final String pictureUrl;
  final String name;
  final String description;
  final int price;
  final double rate;
  final List<PlantType> types;

  Plant(
      {this.id,
      this.pictureUrl,
      this.name,
      this.description,
      this.price,
      this.rate,
      this.types = const []});

  @override
  List<Object> get props => [id, pictureUrl, name, description, price, rate];
}

List<Plant> mockPlant = [
  Plant(
      id: 1,
      pictureUrl: "$imgprofilephoto",
      name: "Adenium Plant",
      description:
          "Tanaman adenium memiliki bunga yang indah dengan perpaduan warna merah muda dan putih.Bunganya yang cantik menjadi alasan mengapa banyak orang menyukai tanaman bonsai adenium yang satu ini",
      price: 20000,
      rate: 4.5,
      types: [PlantType.new_plants]),
  Plant(
      id: 2,
      pictureUrl: "$imgprofilephoto",
      name: "Adenium Plant",
      description:
          "Tanaman adenium memiliki bunga yang indah dengan perpaduan warna merah muda dan putih.Bunganya yang cantik menjadi alasan mengapa banyak orang menyukai tanaman bonsai adenium yang satu ini",
      price: 20000,
      rate: 4.5,
      types: [PlantType.new_plants]),
  Plant(
      id: 3,
      pictureUrl: "$imgprofilephoto",
      name: "Adenium Plant",
      description:
          "Tanaman adenium memiliki bunga yang indah dengan perpaduan warna merah muda dan putih.Bunganya yang cantik menjadi alasan mengapa banyak orang menyukai tanaman bonsai adenium yang satu ini",
      price: 20000,
      rate: 4.5,
      types: [PlantType.recommended]),
  Plant(
      id: 4,
      pictureUrl: "$imgprofilephoto",
      name: "Adenium Plant",
      description:
          "Tanaman adenium memiliki bunga yang indah dengan perpaduan warna merah muda dan putih.Bunganya yang cantik menjadi alasan mengapa banyak orang menyukai tanaman bonsai adenium yang satu ini",
      price: 20000,
      rate: 4.5,
      types: [PlantType.popular]),
];
