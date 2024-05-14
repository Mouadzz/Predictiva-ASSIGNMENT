import 'package:flutter/material.dart';

class DropDownController {
  final ValueNotifier<bool> _valueNotifier = ValueNotifier<bool>(false);

  ValueNotifier<bool> get isShowing => _valueNotifier;

  void toggle() {
    _valueNotifier.value = !_valueNotifier.value;
  }

  void hide() {
    _valueNotifier.value = false;
  }
}
