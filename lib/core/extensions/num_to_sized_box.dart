import 'package:flutter/material.dart';

extension EmptySpace on num {
  SizedBox get vs => SizedBox(height: toDouble());
  SizedBox get hs => SizedBox(width: toDouble());
}
