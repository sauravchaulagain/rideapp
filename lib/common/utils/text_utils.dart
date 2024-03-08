import 'package:flutter/services.dart';

enum TextSizeType { Width, Height }

class TextUtils {
  static Map<String, String> splitName(String fullname) {
    final temp = fullname.split(" ");
    String fname = "";
    String lname = "";

    if (temp.length > 1) {
      fname = temp.first;
      lname = temp.sublist(1).join(" ");
    } else {
      fname = temp.first;
    }

    return {
      'firstname': fname,
      'lastname': lname,
    };
  }

  static String get generateGreet {
    final int hour = DateTime.now().hour;
    if (hour < 12) {
      return "Good morning,";
    }
    if (hour < 18) {
      return "Good afternoon,";
    }
    return "Good evening,";
  }

  static String replaceSpecialCharecterWithSpace(String text,
      {String replace = ' '}) {
    return text
        .replaceAll(RegExp('[^A-Za-z0-9]'), replace)
        .capitalize(allWords: false);
  }

  static bool validateEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  static String replaceEmptyWithDash(dynamic value) {
    return (value?.toString() ?? "").isNotEmpty ? value.toString() : "-";
  }

  static String formatTemplateMessage(
      {required String templateMessage,
      String recipientName = "",
      String senderName = ""}) {
    String temp = templateMessage;
    temp = temp.replaceAll("<%= recipient_name %>",
        recipientName.isNotEmpty ? recipientName : "_recipient_name_");
    temp = temp.replaceAll("<%= sender_name %>",
        senderName.isNotEmpty ? senderName : "_sender_name_");
    return temp;
  }

  static List<TextInputFormatter> get textOnlyFormater =>
      [FilteringTextInputFormatter(RegExp(r'[a-zA-Z ]'), allow: true)];

  static List<TextInputFormatter> get numberOnlyFormater =>
      [FilteringTextInputFormatter.digitsOnly];

  static List<TextInputFormatter> get decimalInputFormater =>
      [FilteringTextInputFormatter.allow(RegExp("[0-9.]"))];

  static String filterSpecialCharacterExceptPlus(String val) {
    return val
        .replaceAll(RegExp('[^+0-9]'), "")
        .trim()
        .replaceAll("+977", "")
        .replaceAll("977", "")
        .trim();
  }
}

extension Capitalize on String {
  String capitalize({bool allWords = true}) {
    if (isEmpty) {
      return this;
    }
    if (allWords) {
      final List<String> words = split(' ');
      final List<String> capitalized = <String>[];
      for (var w in words) {
        capitalized.add(w.capitalize(allWords: false));
      }
      return capitalized.join(' ');
    } else {
      return substring(0, 1).toUpperCase() + substring(1).toLowerCase();
    }
  }
}
