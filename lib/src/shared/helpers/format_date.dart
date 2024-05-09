import 'package:intl/intl.dart';

class FormatDateCustom {
  static String dateWithHours(DateTime date) {
    DateFormat dateFormat = DateFormat('dd/MM/yyyy HH:mm');
    return dateFormat.format(date);
  }
}
