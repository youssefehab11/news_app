import 'package:intl/intl.dart';

extension StringDateFormats on String {
  String get formatDate {
    DateFormat inputFormat = DateFormat('yyyy-MM-ddTHH:mm:ssZ');
    DateTime inputDate = inputFormat.parse(this);
    DateTime currentDate = DateTime.now();
    String result;
    int difference;
    if (currentDate.year - inputDate.year > 0) {
      difference = currentDate.year - inputDate.year;
      result = isSingleDifference(difference)
          ? '1 year ago'
          : '$difference years ago';
    } else if (currentDate.month - inputDate.month > 0) {
      difference = currentDate.month - inputDate.month;
      result = isSingleDifference(difference)
          ? '1 month ago'
          : '$difference months ago';
    } else if (currentDate.day - inputDate.day > 0) {
      difference = currentDate.day - inputDate.day;
      result =
          isSingleDifference(difference) ? '1 day ago' : '$difference days ago';
    } else if (currentDate.hour - inputDate.hour > 0) {
      difference = currentDate.hour - inputDate.hour;
      result = isSingleDifference(difference)
          ? '1 hour ago'
          : '$difference hours ago';
    } else if (currentDate.minute - inputDate.minute > 0) {
      difference = currentDate.minute - inputDate.minute;
      result =
          isSingleDifference(difference) ? '1 min ago' : '$difference mins ago';
    } else {
      result = 'now';
    }
    return result;
  }
}

bool isSingleDifference(int difference) {
  return difference == 1;
}
