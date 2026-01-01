// dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class YHelperFunctions {
  static Color? getColor(String value) {
    final v = value.toLowerCase().trim();
    if (v == 'green') {
      return Colors.green;
    } else if (v == 'red') {
      return Colors.red;
    } else if (v == 'blue') {
      return Colors.blue;
    } else if (v == 'yellow') {
      return Colors.yellow;
    } else if (v == 'black') {
      return Colors.black;
    } else if (v == 'white') {
      return Colors.white;
    } else if (v == 'grey' || v == 'gray') {
      return Colors.grey;
    } else if (v == 'orange') {
      return Colors.orange;
    } else if (v == 'purple') {
      return Colors.purple;
    } else if (v == 'pink') {
      return Colors.pink;
    } else {
      return null;
    }
  }

  static void showSnackBar(String message) {
    ScaffoldMessenger.of(
      Get.context!,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  static void showAlert(String title, String message) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  static String getFormatDate(DateTime date, {String format = 'dd/MM/yyyy'}) {
    return DateFormat(format).format(date);
  }

  static List<Y> removeDuplicates<Y>(List<Y> list) {
    return list.toSet().toList();
  }

  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
    final wrappedList = <Widget>[];
    if (rowSize <= 0) return wrappedList;
    for (var i = 0; i < widgets.length; i += rowSize) {
      final end = (i + rowSize) > widgets.length
          ? widgets.length
          : (i + rowSize);
      final rowChildren = widgets.sublist(i, end);
      wrappedList.add(
        Row(mainAxisAlignment: MainAxisAlignment.start, children: rowChildren),
      );
    }
    return wrappedList;
  }
}
