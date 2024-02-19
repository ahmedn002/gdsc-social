import 'package:flutter/material.dart';

class GeneralUtils {
  static MaterialColor createMaterialColor(Color color) {
    final strengths = <double>[.05];
    final swatch = <int, Color>{};
    final r = color.red, g = color.green, b = color.blue;

    for (var i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }

    for (var strength in strengths) {
      final ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }

    return MaterialColor(color.value, swatch);
  }

  static String parseDurationAsTimeAgo(Duration duration) {
    if (duration.inDays > 365) {
      final years = (duration.inDays / 365).floor();
      return years == 1 ? '1 year ago' : '$years years ago';
    } else if (duration.inDays > 30) {
      final months = (duration.inDays / 30).floor();
      return months == 1 ? '1 month ago' : '$months months ago';
    } else if (duration.inDays > 7) {
      final weeks = (duration.inDays / 7).floor();
      return weeks == 1 ? '1 week ago' : '$weeks weeks ago';
    } else if (duration.inDays > 0) {
      return duration.inDays == 1 ? '1 day ago' : '${duration.inDays} days ago';
    } else if (duration.inHours > 0) {
      return duration.inHours == 1 ? '1 hour ago' : '${duration.inHours} hours ago';
    } else if (duration.inMinutes > 0) {
      return duration.inMinutes == 1 ? '1 minute ago' : '${duration.inMinutes} minutes ago';
    } else {
      return 'Just now';
    }
  }
}
