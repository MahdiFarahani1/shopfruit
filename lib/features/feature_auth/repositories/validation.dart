class FormValid {
  static String? checkOnlyNumbers(String? value) {
    if (value != null && !RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'لطفاً تنها اعداد وارد کنید';
    }
    return null;
  }

  static String? checkOnlyPersianLetters(String? value) {
    if (value != null && !RegExp(r'^[\u0600-\u06FF]+$').hasMatch(value)) {
      return 'لطفاً تنها حروف فارسی وارد کنید';
    }
    return null;
  }

  static String? checkPasswordStrength(String? value) {
    if (value == null || value.length < 8) {
      return 'رمز عبور باید حداقل ۸ کاراکتر داشته باشد';
    }
    if (!RegExp(r'[0-9]').hasMatch(value) ||
        !RegExp(r'[a-zA-Z]').hasMatch(value)) {
      return 'رمز عبور باید شامل حداقل یک عدد و به انگلیسی باشد';
    }
    return null;
  }
}
