import 'dart:math';
import 'dart:ui';

import 'package:intl/intl.dart';

extension StringExtensions on String {

  Color formatToColor() {
    final buffer = StringBuffer();
    if (length == 6 || length == 7) buffer.write('ff'); // Default alpha to 100%
    buffer.write(replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Format Date
  String formatDate({String? format}) {
    // if(format)
    return DateFormat(format ?? 'dd-LLL-yyyy')
        .format(DateTime.tryParse(this) ?? DateTime.now());
  }

  bool get isValidEmail {
    final emailRegex = RegExp(
      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
    );
    return emailRegex.hasMatch(this);
  }

  /// Checks if the password meets custom security requirements.
  ///
  /// [minLength] - Minimum required length (default: 8).
  /// [requireUppercase] - Requires at least one uppercase letter (default: true).
  /// [requireLowercase] - Requires at least one lowercase letter (default: true).
  /// [requireDigit] - Requires at least one digit (default: true).
  /// [requireSpecialChar] - Requires at least one special character (default: true).
  bool isValidPasswordDynamic({
    int minLength = 8,
    bool requireUppercase = true,
    bool requireLowercase = true,
    bool requireDigit = true,
    bool requireSpecialChar = true,
  }) {
    String pattern = r'^';

    if (requireUppercase) pattern += r'(?=.*[A-Z])';
    if (requireLowercase) pattern += r'(?=.*[a-z])';
    if (requireDigit) pattern += r'(?=.*\d)';
    if (requireSpecialChar) pattern += r'(?=.*[@$!%*?&])';

    pattern += '.{' + minLength.toString() + r',}$';

    final passwordRegex = RegExp(pattern);
    return passwordRegex.hasMatch(this);
  }

  /// Checks if the password is valid based on the following criteria:
  /// - At least 8 characters
  /// - At least 1 uppercase letter
  /// - At least 1 lowercase letter
  /// - At least 1 number
  /// - At least 1 special character
  bool get isValidPassword {
    final passwordRegex = RegExp(
      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
    );
    return passwordRegex.hasMatch(this);
  }
}