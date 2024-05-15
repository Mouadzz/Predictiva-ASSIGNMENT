import 'package:flutter/material.dart';
import 'package:predictiva/core/core.dart';

class PriceInputField extends StatefulWidget {
  const PriceInputField({
    required this.initialValue,
    required this.isMobileLayout,
    required this.onPriceChange,
    super.key,
  });

  final bool isMobileLayout;
  final double? initialValue;
  final void Function(double?) onPriceChange;

  @override
  State<PriceInputField> createState() => _PriceInputFieldState();
}

class _PriceInputFieldState extends State<PriceInputField> {
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    if (widget.initialValue != null) {
      textEditingController.text = widget.initialValue!.toString();
    }

    textEditingController
      ..text = widget.initialValue != null ? widget.initialValue.toString() : ''
      ..addListener(() {
        widget.onPriceChange(double.tryParse(textEditingController.text));
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.mdRadius),
          border: Border.all(color: AppTheme.stroke),
        ),
        child: TextField(
          controller: textEditingController,
          style: TextStyle(
            fontSize: widget.isMobileLayout ? AppSizes.xsText : AppSizes.smText,
            color: AppTheme.grey2,
          ),
          onTapOutside: (_) {
            final primaryFocus = FocusManager.instance.primaryFocus;
            if (primaryFocus != null) primaryFocus.unfocus();
          },
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: widget.isMobileLayout
                  ? AppSizes.smPadding
                  : AppSizes.lgPadding,
            ),
            counterText: '',
            hintText: 'Price',
            hintTextDirection: TextDirection.ltr,
            border: InputBorder.none,
            hintStyle: TextStyle(
              fontSize:
                  widget.isMobileLayout ? AppSizes.xsText : AppSizes.smText,
              color: AppTheme.grey2,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
}
