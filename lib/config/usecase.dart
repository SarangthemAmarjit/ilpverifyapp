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

int validDays({required DateTime expireddate,required DateTime issuedate}) {
  // Get today's date

  
  // Calculate the difference in days
  int validdays = expireddate.difference(issuedate).inDays;
  
  // Return the result
  return validdays;
}