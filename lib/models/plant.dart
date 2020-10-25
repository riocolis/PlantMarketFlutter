part of 'models.dart';

class Plant extends Equatable {
  final int id;
  final String pictureUrl;
  final String name;
  final String description;
  final int price;
  final double rate;

  Plant(
      {this.id,
      this.pictureUrl,
      this.name,
      this.description,
      this.price,
      this.rate});

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
  ),
  Plant(
    id: 2,
    pictureUrl: "$imgprofilephoto",
    name: "Adenium Plant",
    description:
        "Tanaman adenium memiliki bunga yang indah dengan perpaduan warna merah muda dan putih.Bunganya yang cantik menjadi alasan mengapa banyak orang menyukai tanaman bonsai adenium yang satu ini",
    price: 20000,
    rate: 4.5,
  ),
  Plant(
    id: 3,
    pictureUrl: "$imgprofilephoto",
    name: "Adenium Plant",
    description:
        "Tanaman adenium memiliki bunga yang indah dengan perpaduan warna merah muda dan putih.Bunganya yang cantik menjadi alasan mengapa banyak orang menyukai tanaman bonsai adenium yang satu ini",
    price: 20000,
    rate: 4.5,
  ),
  Plant(
    id: 4,
    pictureUrl: "$imgprofilephoto",
    name: "Adenium Plant",
    description:
        "Tanaman adenium memiliki bunga yang indah dengan perpaduan warna merah muda dan putih.Bunganya yang cantik menjadi alasan mengapa banyak orang menyukai tanaman bonsai adenium yang satu ini",
    price: 20000,
    rate: 4.5,
  ),
];
