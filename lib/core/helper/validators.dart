class Validators {
  static String? simpleFieldEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return "فیلد نمایشده نمی‌تواند خالی باشد.";
    }

    return null;
  }

  static String? companyValidation(String? value) {
    if (value == null || value.isEmpty) {
      return "لطفاً کد ملی را وارد کنید.";
    }

    if (!RegExp(r'^\d{11}$').hasMatch(value)) {
      return "شناسه ملی باید 11 رقم و فقط شامل اعداد باشد.";
    }

    return null; // یعنی مشکلی نداره و معتبره
  }

  static String? iranianNationalCodeValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "لطفاً کد ملی را وارد کنید.";
    }

    // چک کردن اینکه فقط عدد باشه و دقیقاً 10 رقم داشته باشه
    if (!RegExp(r'^\d{10}$').hasMatch(value)) {
      return "کد ملی باید ۱۰ رقم و فقط شامل اعداد باشد.";
    }

    // بررسی الگوریتم صحت کد ملی
    if (!_isValidIranianNationalCode(value)) {
      return "کد ملی وارد شده معتبر نیست.";
    }

    return null; // یعنی مشکلی نداره و معتبره
  }

  static bool _isValidIranianNationalCode(String nationalCode) {
    if (nationalCode.length != 10) return false;

    List<int> digits = nationalCode.split('').map((e) => int.parse(e)).toList();
    int sum = 0;

    for (int i = 0; i < 9; i++) {
      sum += digits[i] * (10 - i);
    }

    int remainder = sum % 11;
    int checkDigit = remainder < 2 ? remainder : 11 - remainder;

    return checkDigit == digits[9];
  }
}
