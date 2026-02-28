void main(List<String> arguments) {
  const int experience = 6;
  const int rating = 5;

  final result = calculateBonus(yearsOfExperience: experience, rating: rating);

  print(result);
}

String calculateBonus({required int yearsOfExperience, required int rating}) {
  if (yearsOfExperience >= 3 && rating >= 4) {
    return 'Bonus Granted';
  }
  return 'No Bonus';
}
