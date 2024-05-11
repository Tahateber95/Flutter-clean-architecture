import 'package:intl/intl.dart';

final _longDateFormatter = DateFormat('E, MMMM d');

extension DateTimeExt on DateTime {
  String toLongDateString() {
    return _longDateFormatter.format(this);
  }
}
