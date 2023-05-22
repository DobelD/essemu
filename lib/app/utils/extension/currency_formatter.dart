import 'package:intl/intl.dart';

extension IndonesianCurrencyFormat on int {
  String toCurrencyFormat() {
    var format =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    return format.format(this);
  }
}

extension IndonesianCurrencyFormats on double {
  String toCurrencyFormats() {
    var format =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    return format.format(this);
  }
}
