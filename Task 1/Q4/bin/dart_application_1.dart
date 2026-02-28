void main(List<String> arguments) {
  int salary = 6000;
  int age = 30;
  bool hasExistingLoan = false;

  String result = gradeScore(
    salary: salary,
    age: age,
    hasExistingLoan: hasExistingLoan,
  );
  print("Result: $result");
}

String gradeScore({
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
