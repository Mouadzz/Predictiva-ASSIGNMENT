import 'package:flutter/material.dart';
import 'package:predictiva/core/core.dart';

class OpenTradesPaginationWidget extends StatelessWidget {
  const OpenTradesPaginationWidget({
    required this.onForward,
    required this.onBack,
    required this.paginationText,
    super.key,
  });

  final void Function()? onForward;
  final void Function()? onBack;

  final String paginationText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            paginationText,
            style: const TextStyle(fontSize: 14, color: AppTheme.grey1),
          ),
          Row(
            children: [
              arrowButton(
                assetPath: 'assets/images/nav-arrow-left.png',
                onTap: onBack,
                disabled: onBack == null,
              ),
              const SizedBox(width: 12),
              arrowButton(
                assetPath: 'assets/images/nav-arrow-right.png',
                onTap: onForward,
                disabled: onForward == null,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget arrowButton({
    required void Function()? onTap,
    required String assetPath,
    bool disabled = false,
  }) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: AppTheme.stroke),
          ),
          child: Center(
            child: Image.asset(
              assetPath,
              width: 20,
              height: 20,
              color: disabled ? AppTheme.grey2 : Colors.white,
            ),
          ),
        ),
      );
}
