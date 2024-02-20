import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class BackgroundGradient extends StatelessWidget {
  const BackgroundGradient({
    super.key,
    required PaletteGenerator? paletteGenerator,
  }) : _paletteGenerator = paletteGenerator;

  final PaletteGenerator? _paletteGenerator;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0, 0.2, 0.8, 1],
          colors: [
            Colors.black.withOpacity(0.5),
            _paletteGenerator!.darkMutedColor?.color.withOpacity(0.3) ?? Colors.grey.withOpacity(0.1),
            _paletteGenerator!.darkMutedColor?.color.withOpacity(0.3) ?? Colors.grey.withOpacity(0.1),
            Colors.black.withOpacity(0.5),
          ],
        ),
      ),
    );
  }
}
