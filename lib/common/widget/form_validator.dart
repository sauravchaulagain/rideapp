class FormValidator {
  // static String? validatePassword(String? val, {String? label}) {
  //   final RegExp _regex = RegExp(
  //       r"^.*(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=!]).*$");
  //   if (val == null) {
  //     return LocaleKeys.fieldCannotBeEmpty
  //         .tr(args: [label ?? LocaleKeys.password.tr()]);
  //   } else if (val.isEmpty) {
  //     return LocaleKeys.fieldCannotBeEmpty
  //         .tr(args: [label ?? LocaleKeys.password.tr()]);
  //   } else if (_regex.hasMatch(val)) {
  //     return null;
  //   } else {
  //     return LocaleKeys.invalidPasswordMessage
  //         .tr(args: [label ?? LocaleKeys.password.tr()]);
  //   }
  // }

  static String? validatePhoneNumber(String? val) {
    final RegExp regExp = RegExp(r'([9][678][0-6][0-9]{7})');
    if (val == null) {
      // return LocaleKeys.fieldCannotBeEmpty
      //     .tr(args: [LocaleKeys.phoneNumber.tr()]);
      return "Enter a valid Number";
    } else if (val.isEmpty) {
      return "Number cannot be empty.";

      // return LocaleKeys.fieldCannotBeEmpty
      //     .tr(args: [LocaleKeys.phoneNumber.tr()]);
    } else if (val.length != 10 || !regExp.hasMatch(val)) {
      return "Enter a valid Number";

      //return LocaleKeys.enterValidPhoneNumber.tr();
    } else {
      return null;
    }
  }

  static String? validateFieldNotEmpty(String? p0, String fieldName) {
    if (p0 == null) {
      return "$fieldName cannot be empty.";
    } else if (p0.isEmpty) {
      return "$fieldName cannot be empty.";
      // return LocaleKeys.fieldCannotBeEmpty.tr(args: [fieldName]);
    } else {
      return null;
    }
  }

  static String? validateDateOfBirth(String? val) {
    if (val == null || val == "") {
      return "Date of birth field cannot be empty";
    } else if (val.isEmpty) {
      final DateTime dateTime = DateTime.parse(val);
      final maxDate = DateTime.now().year - 21;
      if (dateTime.year < maxDate) {
        return "Date of birth field cannot be empty";
      } else {
        return "Date of birth must be at least 21 years old";
      }
    } else {
      return null;
    }
  }

  static String? validateAmount(
      {required String val,
      required double minAmount,
      required double maxAmount}) {
    if (val.isEmpty) {
      return "Amount field cannot be empty";
    } else {
      double? amount = double.tryParse(val);
      if (amount == null) {
        return "Invalid amount";
      } else if (amount >= minAmount && amount <= maxAmount) {
        return null;
      } else {
        return "Amount must be between $minAmount and $maxAmount";
      }
    }
  }
}
