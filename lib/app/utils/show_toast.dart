import 'package:flutter/material.dart';

void showToast(scaffold, String message) {
  scaffold.showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      elevation: 6,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      duration: const Duration(seconds: 2),
    ),
  );
}
