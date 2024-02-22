import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdsc_social/features/story/domain/entities/story_entity.dart';
import 'package:gdsc_social/features/story/view/state/stories%20view/stories_view_cubit.dart';
import 'package:gdsc_social/features/story/view/ui/components/story_screen_body.dart';
import 'package:go_router/go_router.dart';

class StoriesPageView extends StatefulWidget {
  final List<StoryEntity> stories;
  final StoryEntity initialStory;
  const StoriesPageView({super.key, required this.stories, required this.initialStory});

  @override
  State<StoriesPageView> createState() => _StoriesPageViewState();
}

class _StoriesPageViewState extends State<StoriesPageView> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: widget.stories.indexOf(widget.initialStory),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoriesViewCubit, StoriesViewState>(
      builder: (context, state) {
        assert(state is StoriesViewIndexChange);
        return PageView.builder(
          controller: _pageController,
          itemCount: widget.stories.length,
          itemBuilder: (context, index) {
            return StoryScreenBody(
              story: widget.stories[index],
              onStoryComplete: () {
                if (index == widget.stories.length - 1) {
                  context.pop();
                  return;
                }
                _pageController.nextPage(
                  duration: 300.ms,
                  curve: Curves.easeInOut,
                );
              },
              onPreviousStory: () {
                if (index == 0) {
                  context.pop();
                  return;
                }
                _pageController.previousPage(
                  duration: 300.ms,
                  curve: Curves.easeInOut,
                );
              },
            );
          },
        );
      },
    );
  }
}
