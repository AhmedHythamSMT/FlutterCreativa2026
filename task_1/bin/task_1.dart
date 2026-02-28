import 'package:task_1/task_1.dart' as task_1;

void main(List<String> arguments) {
  print('Q1:');
  print(
    task_1.userAuth(
      username: 'student',
      password: 'iti123',
      isAccountActive: true,
    ),
  );
  print('Q2:');
  print(
    "Discounted Price: ${task_1.discountPrice(productprice: 100, isPremium: true, hasCoupon: false)}",
  );
  print('Q3:');
  print(task_1.gradeScore(examScore: 80, attendance: 80));
  print('Q4:');
  print(task_1.loanElig(salary: 6000, age: 30, hasExistingLoan: false));
  print('Q5:');
  print(
    "Total Cost: ${task_1.totalDeliveryCost(orderAmount: 100, distanceInKilometers: 10.5)}",
  );
  print('Q6:');
  print(task_1.calculateBonus(yearsOfExperience: 5, rating: 4));
  print('Q7:');
  print(task_1.adminRoomAccess(hasAccessCard: true, knowsPassword: true));
  print('Q8:');
  print(task_1.electricityUsage(electricityUsage: 350));
  print('Q9:');
  print(task_1.newLevelUnlock(completedLessons: 10, quizScore: 75));
  print('Q10:');
  print(
    task_1.requestRide(isDriverAvailable: true, userBalance: 100, tripCost: 50),
  );
}
