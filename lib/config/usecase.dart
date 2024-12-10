String  dateTimetoString(DateTime datetime){
  return '${datetime.day}/${datetime.month}/${datetime.year}';
}

int remainingDays(DateTime targetDate) {
  // Get today's date
  DateTime today = DateTime.now();
  
  // Calculate the difference in days
  int remainingDays = targetDate.difference(today).inDays;
  
  // Return the result
  return remainingDays;
}