// lib/utils/formatters/formatter.dart
import 'package:intl/intl.dart';

class YFormatter {
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('yyyy-MM-dd').format(date);
  }

  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'en_US', symbol: '\$').format(amount);
  }

  static String formatPhoneNumber(String phoneNumber) {
    // Simple US phone number formatting (XXX) XXX-XXXX
    if (phoneNumber.length == 10) {
      return '(${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 6)}-${phoneNumber.substring(6)}';
    } else if (phoneNumber.length == 11) {
      return '(${phoneNumber.substring(0, 4)}) ${phoneNumber.substring(4, 7)}-${phoneNumber.substring(7)}';
    }
    return phoneNumber; // Return as is if not 10 digits
  }

  // Not fully tested
  static String internationalFormatPhoneNumber(String phoneNumber) {
    var digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');
    if (digitsOnly.isEmpty) return phoneNumber;

    // Determine a safe country code length (1..3) based on input hints.
    int maxCc = digitsOnly.length;
    int ccLen;
    if (phoneNumber.trim().startsWith('+')) {
      ccLen = digitsOnly.length >= 3 ? 3 : (digitsOnly.length >= 2 ? 2 : 1);
    } else {
      // If the number is longer than 10 digits assume extra leading digits are country code.
      int possible = digitsOnly.length - 10;
      if (possible <= 0) possible = 1;
      if (possible > 3) possible = 3;
      ccLen = possible;
    }
    if (ccLen > maxCc) ccLen = maxCc;

    String countryCode = '+${digitsOnly.substring(0, ccLen)}';
    digitsOnly = digitsOnly.substring(ccLen);

    final formatedNumber = StringBuffer();
    formatedNumber.write('($countryCode) ');

    int i = 0;
    bool firstGroup = true;
    while (i < digitsOnly.length) {
      int groupLength = 2;
      if (firstGroup && countryCode == '+855') {
        groupLength = 3;
      }
      firstGroup = false;

      int end = i + groupLength;
      if (end > digitsOnly.length) end = digitsOnly.length;

      formatedNumber.write(digitsOnly.substring(i, end));

      if (end < digitsOnly.length) {
        formatedNumber.write(' ');
      }
      i = end;
    }

    return formatedNumber.toString();
  }
}
