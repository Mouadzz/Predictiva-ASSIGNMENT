import 'package:flutter/material.dart';
import 'package:predictiva/core/core.dart';
import 'package:predictiva/src/dashboard/dashboard.dart';

class SymbolButton extends StatefulWidget {
  const SymbolButton({
    required this.onSymbolChange,
    required this.isMobile,
    super.key,
    this.initialValue,
  });

  final void Function(TradingSymbol?) onSymbolChange;
  final TradingSymbol? initialValue;
  final bool isMobile;

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
    final iconSize = widget.isMobile ? AppSizes.smIcon : AppSizes.mdIcon;
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.mdRadius),
          border: Border.all(color: AppTheme.stroke),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            padding: EdgeInsets.symmetric(
              horizontal:
                  widget.isMobile ? AppSizes.smPadding : AppSizes.lgPadding,
            ),
            dropdownColor: AppTheme.dark6,
            value: selectedSymbol?.name,
            icon: Image.asset(
              'assets/images/nav-arrow-down.png',
              width: iconSize,
              height: iconSize,
            ),
            borderRadius: BorderRadius.circular(AppSizes.mdRadius),
            hint: Text(
              'Symbol',
              style: TextStyle(
                fontSize: widget.isMobile ? AppSizes.xsText : AppSizes.smText,
                color: AppTheme.grey2,
              ),
            ),
            items: TradingSymbol.values.map((symbol) {
              return DropdownMenuItem<String>(
                value: symbol.name,
                child: Text(
                  symbol.name,
                  style: TextStyle(
                    fontSize:
                        widget.isMobile ? AppSizes.xsText : AppSizes.smText,
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
