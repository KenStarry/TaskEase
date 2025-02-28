import 'dart:math';

import 'package:intl/intl.dart';

extension StringExtensions on String {
  /// Format Date
  String formatDate({String? format}) {
    // if(format)
    return DateFormat(format ?? 'dd-LLL-yyyy')
        .format(DateTime.tryParse(this) ?? DateTime.now());
  }
}