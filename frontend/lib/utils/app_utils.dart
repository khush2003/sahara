enum DeliveryPaidBy { donor, receiver, both }

DeliveryPaidBy convertFromString(String deliveryPaidBy) {
  switch (deliveryPaidBy) {
    case 'donor':
      return DeliveryPaidBy.donor;
    case 'receiver':
      return DeliveryPaidBy.receiver;
    case 'both':
      return DeliveryPaidBy.both;
    default:
      return DeliveryPaidBy.donor;
  }
}

String formatDuration(Duration duration) {
  int days = duration.inDays;
  return '$days ${days == 1 ? 'day' : 'days'}';
}
