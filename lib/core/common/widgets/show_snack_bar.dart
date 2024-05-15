import 'package:flutter/material.dart';
import 'package:predictiva/core/core.dart';

void showSnackBar(BuildContext context, Failure failure) {
  final snackBar = SnackBar(
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ErrorMessages.getErrorTitleFromFailure(failure),
          style: const TextStyle(
            color: AppTheme.error,
            fontSize: AppSizes.mdText,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          failure.message,
          style: const TextStyle(
            color: AppTheme.grey1,
            fontSize: AppSizes.smText,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
    backgroundColor: AppTheme.dark6,
  );
  ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(snackBar);
}
