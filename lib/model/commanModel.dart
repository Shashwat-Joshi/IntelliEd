String logoPath = 'assets/student/images/logo.png';

String tagLine =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Neque in.";

List<String> monthNames = [
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

List<String> weekDayName = [
  'Mon',
  'Tue',
  'Wed',
  'Thu',
  'Fri',
  'Sat',
  'Sun',
];

String currentDate =
    "${DateTime.now().day} ${monthNames[int.parse('${DateTime.now().month}')]} ${DateTime.now().year}";

int weekDay = DateTime.now().weekday - 1;
