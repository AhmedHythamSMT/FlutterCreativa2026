void main(List<String> arguments) {
  final electricityUsage = ElectricityUsage();
  final result = electricityUsage(electricityUsage: 350);
  print(result);
}

class ElectricityUsage {
  String call({required int electricityUsage}) {
    if (electricityUsage < 200) {
      return 'Low Consumption';
    } else if (electricityUsage >= 200 && electricityUsage < 500) {
      return 'Medium Consumption';
    } else if (electricityUsage >= 500) {
      return 'High Consumption';
    } else {
      return 'Invalid Consumption Value';
    }
  }
}
