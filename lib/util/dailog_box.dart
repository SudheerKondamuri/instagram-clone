import 'package:flutter/material.dart';

Future<void> dailogBuilder(BuildContext context, String message) {
  return showDialog(
    context: context,
    builder:
        (context) => AlertDialog(
          title: Text("Error"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("OK"),
            ),
          ],
        ),
  );
}
