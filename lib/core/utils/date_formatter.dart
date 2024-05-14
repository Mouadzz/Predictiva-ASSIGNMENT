String formatDate(DateTime dateTime) {
  final month = months[dateTime.month - 1];
  final day = dateTime.day.toString();
  final year = dateTime.year.toString();

  return '$day $month, $year';
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
