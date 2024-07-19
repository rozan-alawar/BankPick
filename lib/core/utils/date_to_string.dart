import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ConvertDate {
  static String dateToString(DateTime dateTime) {
    final formatter = DateFormat('dd/MM/yyyy').format(dateTime);
    return formatter;
  }

  static String stringToDate(String date) {
    DateTime parsedDate = DateTime.parse(date);
    final formatter = DateFormat('dd/MM/yyyy').format(parsedDate);
    return formatter;
  }


}
