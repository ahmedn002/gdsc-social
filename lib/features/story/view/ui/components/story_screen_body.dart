import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_social/core/extensions/num_to_sized_box.dart';
import 'package:gdsc_social/core/utils/general.dart';
import 'package:gdsc_social/features/story/domain/entities/story_entity.dart';
import 'package:gdsc_social/features/story/view/ui/components/story_bottom_section.dart';
import 'package:gdsc_social/features/story/view/ui/components/story_header.dart';
import 'package:gdsc_social/features/story/view/ui/widgets/story_image.dart';
import 'package:palette_generator/palette_generator.dart';

import '../../../../../core/constants/measurements.dart';
import 'background_gradient.dart';

class StoryScreenBody extends StatefulWidget {
  final StoryEntity story;
  const StoryScreenBody({super.key, required this.story});

  @override
  State<StoryScreenBody> createState() => _StoryScreenBodyState();
}

class _StoryScreenBodyState extends State<StoryScreenBody> {
  PaletteGenerator? _paletteGenerator;
  int _currentIndex = 0;
  bool _imageIsLoading = true;
  late List<ImageProvider> _imageProviders;
  final TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _updatePalette();
    _imageProviders = [
      for (var image in widget.story.storyImages) CachedNetworkImageProvider(image.url),
    ];
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    for (var imageProvider in _imageProviders) {
      precacheImage(imageProvider, context);
    }
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
              Column(
                children: [
                  StoryHeaderSection(
                    story: widget.story,
                    currentIndex: _currentIndex,
                    shouldLoadViewTime: !_imageIsLoading,
                    onLoadingComplete: (int completedIndex, bool isLastIndex) {
                      if (isLastIndex) {
                        Navigator.of(context).pop();
                        return;
                      }
                      setState(() {
                        _currentIndex = completedIndex + 1;
                        _imageIsLoading = true;
                      });
                    },
                  ),
                  Measurements.pageVerticalPadding.vs,
                  Expanded(
                    child: StoryImage(
                      imageUrl: widget.story.storyImages[_currentIndex].url,
                      onLoadingComplete: _scheduleLoadingDonePostFrameCallback,
                    ),
                  ),
                  Measurements.pageVerticalPadding.vs,
                  StoryBottomSection(
                    controller: _messageController,
                    userTag: widget.story.userTag,
                  ),
                  Measurements.pageVerticalPadding.vs,
                ],
              ),
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

  void _scheduleLoadingDonePostFrameCallback() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _imageIsLoading = false;
      });
    });
  }
}
