part of 'shared.dart';

class Helpers {
  static String formatIDR(dynamic value) {
    return NumberFormat.currency(
            locale: 'id-ID', symbol: 'IDR ', decimalDigits: 0)
        .format(value);
  }

  static String convertDateTime(DateTime dateTime) {
    String month;
    switch (dateTime.month) {
      case 1:
        month = 'Jan';
        break;
      case 2:
        month = 'Feb';
        break;
      case 3:
        month = 'Mar';
        break;
      case 4:
        month = 'Apr';
        break;
      case 5:
        month = 'May';
        break;
      case 6:
        month = 'Jun';
        break;
      case 7:
        month = 'Jul';
        break;
      case 8:
        month = 'Aug';
        break;
      case 9:
        month = 'Sep';
        break;
      case 10:
        month = 'Oct';
        break;
      case 11:
        month = 'Nov';
        break;
      default:
        month = 'Des';
        break;
    }
    return month + ' ${dateTime.day}, ${dateTime.hour}:${dateTime.minute}';
  }

  static String transactionString(TransactionStatus transactionStatus) {
    switch (transactionStatus) {
      case TransactionStatus.delivered:
        return 'Delivered';
        break;
      case TransactionStatus.cancelled:
        return 'Cancelled';
        break;
      case TransactionStatus.onDelivery:
        return 'On Delivery';
        break;
      default:
        return 'Pending';
    }
  }

  static Color transactionColor(TransactionStatus transactionStatus) {
    switch (transactionStatus) {
      case TransactionStatus.delivered:
        return Colors.green;
        break;
      case TransactionStatus.cancelled:
        return Colors.red;
        break;
      case TransactionStatus.onDelivery:
        return Colors.blue;
        break;
      default:
        return Colors.orange;
    }
  }
}
