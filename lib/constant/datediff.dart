String getTimeDifference(DateTime givenDateTime) {
  DateTime now = DateTime.now();
  Duration difference = now.difference(givenDateTime);

  if (difference.inDays >= 365) {
    int years = difference.inDays ~/ 365;
    return '$years year${years > 1 ? "s" : ""} ago';
  } else if (difference.inDays >= 30) {
    int months = difference.inDays ~/ 30;
    return '$months month${months > 1 ? "s" : ""} ago';
  } else if (difference.inDays >= 1) {
    return '${difference.inDays} day${difference.inDays > 1 ? "s" : ""} ago';
  } else if (difference.inHours >= 1) {
    return '${difference.inHours} hour${difference.inHours > 1 ? "s" : ""} ago';
  } else if (difference.inMinutes >= 1) {
    return '${difference.inMinutes} minute${difference.inMinutes > 1 ? "s" : ""} ago';
  } else {
    return 'just now';
  }
}

// void main() {
//   DateTime givenDateTime = DateTime(2023, 7, 18, 9, 31, 40);
//   String timeDifference = getTimeDifference(givenDateTime);
//   print(timeDifference); // Output: "1 day ago"
// }
