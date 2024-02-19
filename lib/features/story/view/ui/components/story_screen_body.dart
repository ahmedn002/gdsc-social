import 'package:flutter/material.dart';
import 'package:gdsc_social/features/story/domain/entities/story_entity.dart';
import 'package:gdsc_social/features/story/view/ui/components/story_header.dart';
import 'package:palette_generator/palette_generator.dart';

class StoryScreenBody extends StatefulWidget {
  final StoryEntity story;
  const StoryScreenBody({super.key, required this.story});

  @override
  State<StoryScreenBody> createState() => _StoryScreenBodyState();
}

class _StoryScreenBodyState extends State<StoryScreenBody> {
  PaletteGenerator? _paletteGenerator;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _updatePaletteGenerator();
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
                  child: Container(
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
                  ),
                ),
              Positioned.fill(
                child: Image.network(
                  widget.story.storyImages[0].url,
                  fit: BoxFit.fitWidth,
                ),
              ),
              StoryHeaderSection(story: widget.story),
            ],
          ),
        );
      },
    );
  }

  Future<void> _updatePaletteGenerator() async {
    _paletteGenerator = await PaletteGenerator.fromImageProvider(
      NetworkImage(widget.story.storyImages[0].url),
      size: const Size(100, 100),
    );
    setState(() {});
  }
}
