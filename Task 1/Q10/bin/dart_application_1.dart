void main(List<String> arguments) {
  bool driverIsNear = true;
  double myWallet = 50.0;
  double estimatedCost = 35.50;

  final requestRide = RequestRide();

  final status = requestRide.execute(
    isDriverAvailable: driverIsNear,
    userBalance: myWallet,
    tripCost: estimatedCost,
  );

  print(status);
}

class RequestRide {
  String execute({
    required bool isDriverAvailable,
    required double userBalance,
    required double tripCost,
  }) {
    if (isDriverAvailable && userBalance >= tripCost) {
      return 'Ride Confirmed';
    }

    return 'Insufficient Conditions';
  }
}
