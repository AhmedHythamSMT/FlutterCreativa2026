//Q1
String userAuth({
  required String username,
  required String password,
  bool? isAccountActive,
}) {
  String message = (isAccountActive == true)
      ? "Login Successful"
      : "Access Denied";
  return "$message";
}

//Q2
double discountPrice({
  required double productprice,
  required bool isPremium,
  required bool hasCoupon,
}) {
  double finalPrice = productprice;
  if (isPremium || hasCoupon) {
    finalPrice -= finalPrice * 0.15;
  }
  return finalPrice;
}

//Q3
String gradeScore({required double examScore, required double attendance}) {
  double totalScore = examScore + attendance;
  if (totalScore >= 50 && attendance >= 75) {
    return "Passed";
  } else {
    return "Failed";
  }
}

//Q4
String loanElig({
  required int salary,
  required int age,
  required bool hasExistingLoan,
}) {
  if (salary >= 5000 && age >= 21 && age <= 60 && !hasExistingLoan) {
    return "Loan Approved";
  } else {
    return "Loan Rejected";
  }
}

//Q5
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

//Q6
String calculateBonus({required int yearsOfExperience, required int rating}) {
  if (yearsOfExperience >= 3 && rating >= 4) {
    return 'Bonus Granted';
  }
  return 'No Bonus';
}

//Q7
String adminRoomAccess({
  required bool hasAccessCard,
  required bool knowsPassword,
}) {
  if (hasAccessCard && knowsPassword) {
    return 'Door Opened';
  }
  return 'Access Restricted';
}

//Q8

String electricityUsage({required int electricityUsage}) {
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

//Q9
String newLevelUnlock({required int completedLessons, required int quizScore}) {
  if (completedLessons >= 10 && quizScore >= 70) {
    return 'Level Unlocked';
  } else {
    return 'Complete Requirements';
  }
}

//Q10
String requestRide({
  required bool isDriverAvailable,
  required double userBalance,
  required double tripCost,
}) {
  if (isDriverAvailable && userBalance >= tripCost) {
    return 'Ride Confirmed';
  }

  return 'Insufficient Conditions';
}
