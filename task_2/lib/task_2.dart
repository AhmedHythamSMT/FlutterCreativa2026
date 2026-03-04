class Task2 {
  // 1
  int count() {
    int result = 0;
    for (int i = 0; i < 3; i++) {
      print('Step number $i');
      result++;
    }
    return result;
  }

  // 2
  void players() => [
    'Zidane',
    'Messi',
    'Ronaldo',
  ].forEach((p) => print('Current player: $p'));

  // 3
  void battery() {
    int life = 20;
    while (life > 0) {
      print('Phone is still on... battery at $life%');
      life -= 5;
    }
  }

  // 4
  void wifiConnection() {
    int attempts = 2;
    do {
      print('Trying to connect to WiFi...');
      attempts++;
    } while (attempts < 0);
  }

  // 5
  void fruits() =>
      ['Pineapple', 'Banana', 'Mango'].forEach((f) => print('Eating a $f'));

  // 6
  int countVowels(String s) {
    int count = s
        .toLowerCase()
        .split('')
        .where((c) => 'aeiou'.contains(c))
        .length;
    print('Number of vowels in "$s" is');
    return count;
  }

  // 7
  int calcFactorial(int n) {
    int res = 1;
    for (int i = 1; i <= n; i++) res *= i;
    print('Factorial of $n is');
    return res;
  }

  // 8
  bool isPalindrome(String w) =>
      w.toLowerCase() == w.toLowerCase().split('').reversed.join('');

  // 9
  String flipString(String s) => s.split('').reversed.join('');

  // 10
  void countdown(int sec) {
    while (sec > 0) {
      print("$sec...");
      sec--;
    }
  }
}
