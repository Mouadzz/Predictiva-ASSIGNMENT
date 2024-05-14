import 'package:flutter/material.dart';
import 'package:predictiva/core/core.dart';

class SymbolButton extends StatefulWidget {
  const SymbolButton({
    required this.onSymbolChange,
    super.key,
    this.initialValue,
  });

  final void Function(String?) onSymbolChange;
  final String? initialValue;

  @override
  State<SymbolButton> createState() => _SymbolButtonState();
}

class _SymbolButtonState extends State<SymbolButton> {
  String? selectedSymbol;
  List<String> symbolList = ['Symbol 1', 'Symbol 2', 'Symbol 3'];

  @override
  void initState() {
    selectedSymbol = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppTheme.stroke),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            isDense: true,
            dropdownColor: AppTheme.dark6,
            value: selectedSymbol,
            icon: Image.asset(
              'assets/images/nav-arrow-down.png',
              width: 12.sp,
              height: 12.sp,
            ),
            borderRadius: BorderRadius.circular(8),
            hint: Text(
              'Symbol',
              style: TextStyle(
                fontSize: 9.sp,
                color: AppTheme.grey2,
              ),
            ),
            items: symbolList.map((String symbol) {
              return DropdownMenuItem<String>(
                value: symbol,
                child: Text(
                  symbol,
                  style: TextStyle(
                    fontSize: 9.sp,
                    color: AppTheme.grey2,
                  ),
                ),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedSymbol = value;
                widget.onSymbolChange(selectedSymbol);
              });
            },
          ),
        ),
      ),
    );
  }
}
