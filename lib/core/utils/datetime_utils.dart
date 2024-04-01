class DateTimeUtils {
  // Function to parse date and time string into DateTime object
  static DateTime parseDateTime(String dateTimeString) {
    return DateTime.parse(dateTimeString);
  }

  // Function to format DateTime object into desired format
  static String formatDate(String dateTimeString) {
    DateTime dateTime = DateTimeUtils.parseDateTime(dateTimeString);
    String formattedDate = "${dateTime.day}/${dateTime.month}/${dateTime.year}";
    return formattedDate;
  }

  static String formatTime(String dateTimeString) {
    DateTime dateTime = DateTimeUtils.parseDateTime(dateTimeString);
    String formattedTime = "${dateTime.hour}:${dateTime.minute}";
    return formattedTime;
  }
}
