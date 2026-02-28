void main(List<String> arguments) {
  int orderAmount = 100;
  double distanceInKilometers = 10.5;
  double totalCost = totalDeliveryCost(
    orderAmount: orderAmount,
    distanceInKilometers: distanceInKilometers,
  );
  print('Total Delivery Cost: \$${totalCost.toStringAsFixed(2)}');
}

double totalDeliveryCost({
  required int orderAmount,
  required double distanceInKilometers,
}) {
  double fee = distanceInKilometers * 5;
  double totalCost = orderAmount + fee;
  if (orderAmount >= 300) {
    totalCost -= fee;
  }
  return totalCost;
}
