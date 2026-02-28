void main(List<String> arguments) {
  double examScore = 40.0;
  double attendance = 80.0;

  String result = gradeScore(examScore: examScore, attendance: attendance);
  print("Result: $result");
}

String gradeScore({required double examScore, required double attendance}) {
  double totalScore = examScore + attendance;
  if (totalScore >= 50 && attendance >= 75) {
    return "Passed";
  } else {
    return "Failed";
  }
}
