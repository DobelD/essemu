import 'package:intl/intl.dart';

extension IndonesianDateFormat on DateTime {
  String toDates() {
    var format = DateFormat('dd MMMM yyyy HH:mm:ss');
    return format.format(this);
  }
}

extension MillisecondsToString on int {
  String toDateTimeString() {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(this);
    String formattedString =
        '${dateTime.day}-${_addLeadingZero(dateTime.month)}-${_addLeadingZero(dateTime.year)}, ${_addLeadingZero(dateTime.hour)}:${_addLeadingZero(dateTime.minute)}';
    return formattedString;
  }

  String _addLeadingZero(int value) {
    return value.toString().padLeft(2, '0');
  }
}
