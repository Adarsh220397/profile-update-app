import 'package:flutter/material.dart';

class CommonUtils {
  /// Singleton instance
  CommonUtils._internal();

  static CommonUtils instance = CommonUtils._internal();

  void showSnackBar(BuildContext context, String message, [String type = "N"]) {
    final snackBar = SnackBar(
        duration: const Duration(seconds: 5),
        content: Wrap(
          children: [
            Center(
              child:
                  Text(message, style: Theme.of(context).textTheme.subtitle1),
            ),
          ],
        ),
        backgroundColor: type == "P" ? Colors.green : Colors.red);
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
