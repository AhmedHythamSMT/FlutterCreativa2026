void main(List<String> arguments) {
  final newLevelUnlock = NewLevelUnlock();
  final result = newLevelUnlock(completedLessons: 12, quizScore: 75);
  print(result);
}

class NewLevelUnlock {
  String call({required int completedLessons, required int quizScore}) {
    if (completedLessons >= 10 && quizScore >= 70) {
      return 'Level Unlocked';
    } else {
      return 'Complete Requirements';
    }
  }
}
