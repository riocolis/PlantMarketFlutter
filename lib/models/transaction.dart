part of 'models.dart';

enum TransactionStatus { delivered, onDelivery, pending, cancelled }

class Transaction extends Equatable {
  final int id;
  final Plant plant;
  final int quantity;
  final int total;
  final DateTime dateTime;
  final TransactionStatus status;
  final User user;

  Transaction(
      {this.id,
      this.plant,
      this.quantity,
      this.total,
      this.dateTime,
      this.status,
      this.user});

  Transaction copyWith({
    int id,
    Plant plant,
    int quantity,
    int total,
    DateTime dateTime,
    TransactionStatus status,
    User user,
  }) {
    return Transaction(
        id: id ?? this.id,
        plant: plant ?? this.plant,
        quantity: quantity ?? this.quantity,
        total: total ?? this.total,
        dateTime: dateTime ?? this.dateTime,
        status: status ?? this.status,
        user: user ?? this.user);
  }

  @override
  List<Object> get props =>
      [id, plant, quantity, total, dateTime, status, user];
}

List<Transaction> mockTransactions = [
  Transaction(
    id: 1,
    plant: mockPlant[1],
    quantity: 10,
    total: (mockPlant[1].price * 10 * 1.1).round() + 50000,
    dateTime: DateTime.now(),
    status: TransactionStatus.onDelivery,
    user: mockUser,
  ),
  Transaction(
    id: 2,
    plant: mockPlant[2],
    quantity: 7,
    total: (mockPlant[2].price * 7 * 1.1).round() + 50000,
    dateTime: DateTime.now(),
    status: TransactionStatus.onDelivery,
    user: mockUser,
  ),
  Transaction(
    id: 3,
    plant: mockPlant[3],
    quantity: 5,
    total: (mockPlant[3].price * 5 * 1.1).round() + 50000,
    dateTime: DateTime.now(),
    status: TransactionStatus.onDelivery,
    user: mockUser,
  ),
];
