import 'package:flutter/material.dart';

void showToast(scaffold, String message) {
  scaffold.showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: Colors.black.withOpacity(0.7),
      elevation: 6,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      duration: const Duration(seconds: 2),
    ),
  );
}
