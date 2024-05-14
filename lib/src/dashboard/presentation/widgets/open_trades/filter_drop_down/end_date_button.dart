import 'package:flutter/material.dart';
import 'package:predictiva/core/core.dart';
import 'package:predictiva/core/utils/date_formatter.dart';

class EndDateButton extends StatefulWidget {
  const EndDateButton({
    required this.onDateChange,
    super.key,
    this.initialDate,
  });

  final void Function(DateTime?) onDateChange;
  final DateTime? initialDate;

  @override
  State<EndDateButton> createState() => _EndDateButtonState();
}

class _EndDateButtonState extends State<EndDateButton> {
  DateTime? selectedDate;

  @override
  void initState() {
    selectedDate = widget.initialDate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () async {
          final returnedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.parse('2015-01-01'),
            lastDate: DateTime.now(),
          );
          setState(() {
            selectedDate = returnedDate;
            widget.onDateChange(selectedDate);
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppTheme.stroke),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                selectedDate == null ? 'End date' : formatDate(selectedDate!),
                style: TextStyle(
                  fontSize: 9.sp,
                  color: AppTheme.grey2,
                ),
              ),
              Image.asset(
                'assets/images/calendar.png',
                width: 12.sp,
                height: 12.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}