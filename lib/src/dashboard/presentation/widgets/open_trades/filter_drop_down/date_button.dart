import 'package:flutter/material.dart';
import 'package:predictiva/core/core.dart';

class DateButton extends StatefulWidget {
  const DateButton({
    required this.onDateChange,
    required this.useMobileLayout,
    required this.hint,
    super.key,
    this.initialDate,
  });

  final void Function(DateTime?) onDateChange;
  final DateTime? initialDate;
  final bool useMobileLayout;
  final String hint;

  @override
  State<DateButton> createState() => _DateButtonState();
}

class _DateButtonState extends State<DateButton> {
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    if (widget.initialDate != null) {
      textEditingController.text = formatDate(widget.initialDate!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final iconSize = widget.useMobileLayout ? AppSizes.smIcon : AppSizes.mdIcon;
    return Expanded(
      child: GestureDetector(
        onTap: () async {
          final returnedDate = await showDatePicker(
            context: context,
            initialDate: widget.initialDate,
            firstDate: DateTime.parse('2015-01-01'),
            lastDate: DateTime.now(),
          );
          setState(() {
            widget.onDateChange(returnedDate);

            textEditingController.text =
                returnedDate != null ? formatDate(returnedDate) : '';
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizes.mdRadius),
            border: Border.all(color: AppTheme.stroke),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: widget.useMobileLayout
                ? AppSizes.smPadding
                : AppSizes.lgPadding,
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: textEditingController,
                  style: TextStyle(
                    fontSize: widget.useMobileLayout
                        ? AppSizes.xsText
                        : AppSizes.smText,
                    color: AppTheme.grey2,
                  ),
                  enabled: false,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    counterText: '',
                    hintText: widget.hint,
                    hintTextDirection: TextDirection.ltr,
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      fontSize: widget.useMobileLayout
                          ? AppSizes.xsText
                          : AppSizes.smText,
                      color: AppTheme.grey2,
                    ),
                  ),
                ),
              ),
              Image.asset(
                'assets/images/calendar.png',
                width: iconSize,
                height: iconSize,
              ),
            ],
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
