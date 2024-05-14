import 'package:flutter/material.dart';
import 'package:predictiva/core/core.dart';

class PriceInputField extends StatelessWidget {
  const PriceInputField({required this.textEditingController, super.key});

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppTheme.stroke),
        ),
        child: TextField(
          controller: textEditingController,
          style: TextStyle(
            fontSize: 9.sp,
            color: AppTheme.grey2,
          ),
          onTapOutside: (_) {
            final primaryFocus = FocusManager.instance.primaryFocus;
            if (primaryFocus != null) primaryFocus.unfocus();
          },
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
            isDense: true,
            counterText: '',
            hintText: 'Price',
            hintTextDirection: TextDirection.ltr,
            border: InputBorder.none,
            hintStyle: TextStyle(
              fontSize: 9.sp,
              color: AppTheme.grey2,
            ),
          ),
        ),
      ),
    );
  }
}
