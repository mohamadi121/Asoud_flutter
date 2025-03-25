bool isValidIranianNationalCode(String? input) {
  if (input == null ||
      input.length != 10 ||
      !RegExp(r'^\d{10}$').hasMatch(input)) {
    return false;
  }

  List<int> numbers = input.split('').map((e) => int.parse(e)).toList();
  int sum = 0;

  for (int i = 0; i < 9; i++) {
    sum += numbers[i] * (10 - i);
  }

  int remainder = sum % 11;
  int checkDigit = remainder < 2 ? remainder : 11 - remainder;

  return numbers[9] == checkDigit;
}
