extension Capitalize on String {
  String get capitalize => "${this[0].toUpperCase()}${substring(1)}";
}
