import 'package:flutter/material.dart';
import 'package:gdsc_social/core/utils/general.dart';
import 'package:gdsc_social/features/story/domain/entities/story_entity.dart';
import 'package:gdsc_social/features/story/view/ui/components/story_header.dart';
import 'package:palette_generator/palette_generator.dart';

import 'background_gradient.dart';

class StoryScreenBody extends StatefulWidget {
  final StoryEntity story;
  const StoryScreenBody({super.key, required this.story});

  @override
  State<StoryScreenBody> createState() => _StoryScreenBodyState();
}

class _StoryScreenBodyState extends State<StoryScreenBody> {
  PaletteGenerator? _paletteGenerator;
  int _currentIndex = 1;

  @override
  void initState() {
    super.initState();
    _updatePalette();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, BoxConstraints constraints) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: constraints.maxHeight,
            minWidth: constraints.maxWidth,
          ),
          child: Stack(
            children: [
              if (_paletteGenerator != null)
                Positioned.fill(
                  child: BackgroundGradient(paletteGenerator: _paletteGenerator),
                ),
              Positioned.fill(
                child: Image.network(
                  widget.story.storyImages[0].url,
                  fit: BoxFit.fitWidth,
                ),
              ),
              StoryHeaderSection(story: widget.story, currentIndex: _currentIndex),
            ],
          ),
        );
      },
    );
  }

  void _updatePalette() {
    GeneralUtils.getPaletteFromImage(
      NetworkImage(widget.story.storyImages[0].url),
    ).then((value) {
      setState(() {
        _paletteGenerator = value;
      });
    });
  }
}
