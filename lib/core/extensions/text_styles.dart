import 'package:flutter/material.dart';

extension TextStyles on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
}
