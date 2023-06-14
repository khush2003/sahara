enum DeliveryPaidBy{
  self, receiver, both
}

String formatDuration(Duration duration) {
  int days = duration.inDays;
  return '$days ${days == 1 ? 'day' : 'days'}';
}

