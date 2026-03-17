import 'package:intl/intl.dart';

class Formatters {
  static final NumberFormat _currency = NumberFormat.currency(
    locale: 'en_IN',
    symbol: 'INR ',
    decimalDigits: 2,
  );

  static String money(double amount) => _currency.format(amount);

  static String compactDateTime(DateTime dateTime) {
    return DateFormat('dd MMM, hh:mm a').format(dateTime);
  }
}
