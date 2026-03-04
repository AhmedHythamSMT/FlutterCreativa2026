import 'package:task_2/task_2.dart' as task_2;

void main(List<String> arguments) {
  var task = task_2.Task2();
  print("Problem 1:");
  task.count();

  print("\nProblem 2:");
  task.players();

  print("\nProblem 3:");
  task.battery();

  print("\nProblem 4:");
  task.wifiConnection();

  print("\nProblem 5:");
  task.fruits();

  print("\nProblem 6:");
  print(task.countVowels("Hello"));

  print("\nProblem 7:");
  print(task.calcFactorial(5));

  print("\nProblem 8:");
  print(task.isPalindrome("Level"));

  print("\nProblem 9:");
  print("Flipped String: ${task.flipString("Dart")}");

  print("\nProblem 10:");
  task.countdown(3);
}
