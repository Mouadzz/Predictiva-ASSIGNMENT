import 'package:flutter/material.dart';
import 'package:predictiva/core/core.dart';

void showSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(
      message,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    ),
    backgroundColor: AppTheme.dark6,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
