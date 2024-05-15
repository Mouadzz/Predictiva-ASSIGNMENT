String formatDate(DateTime dateTime) {
  final month = months[dateTime.month - 1];
  final day = dateTime.day.toString();
  final year = dateTime.year.toString();

  return '$day $month, $year';
}

bool isSameDateOrAfter(DateTime a, DateTime b) {
  return (a.year == b.year && a.month == b.month && a.day == b.day) ||
      a.isAfter(b);
}

bool isSameDateOrBefore(DateTime a, DateTime b) {
  return (a.year == b.year && a.month == b.month && a.day == b.day) ||
      a.isBefore(b);
}

List<String> months = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec',
];
