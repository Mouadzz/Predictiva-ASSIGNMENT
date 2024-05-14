import 'package:flutter/material.dart';
import 'package:predictiva/core/core.dart';
import 'package:predictiva/src/dashboard/dashboard.dart';

class SymbolButton extends StatefulWidget {
  const SymbolButton({
    required this.onSymbolChange,
    super.key,
    this.initialValue,
  });

  final void Function(TradingSymbol?) onSymbolChange;
  final TradingSymbol? initialValue;

  @override
  State<SymbolButton> createState() => _SymbolButtonState();
}

class _SymbolButtonState extends State<SymbolButton> {
  TradingSymbol? selectedSymbol;

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
            value: selectedSymbol?.name,
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
            items: TradingSymbol.values.map((symbol) {
              return DropdownMenuItem<String>(
                value: symbol.name,
                child: Text(
                  symbol.name,
                  style: TextStyle(
                    fontSize: 9.sp,
                    color: AppTheme.grey2,
                  ),
                ),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                if (value == 'NONE') {
                  selectedSymbol = null;
                } else {
                  selectedSymbol =
                      value != null ? OrderModel.parseSymbol(value) : null;
                }

                widget.onSymbolChange(selectedSymbol);
              });
            },
          ),
        ),
      ),
    );
  }
}
