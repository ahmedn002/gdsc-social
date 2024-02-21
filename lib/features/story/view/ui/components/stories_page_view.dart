import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdsc_social/features/story/domain/entities/story_entity.dart';
import 'package:gdsc_social/features/story/view/state/stories%20view/stories_view_cubit.dart';
import 'package:gdsc_social/features/story/view/ui/components/story_screen_body.dart';

class StoriesPageView extends StatelessWidget {
  final List<StoryEntity> stories;
  final StoryEntity initialStory;
  const StoriesPageView({super.key, required this.stories, required this.initialStory});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoriesViewCubit, StoriesViewState>(
      builder: (context, state) {
        assert(state is StoriesViewIndexChange);
        return PageView.builder(
          itemCount: stories.length,
          itemBuilder: (context, index) {
            return StoryScreenBody(story: stories[index]);
          },
          controller: PageController(
            initialPage: stories.indexOf(initialStory),
          ),
        );
      },
    );
  }
}
