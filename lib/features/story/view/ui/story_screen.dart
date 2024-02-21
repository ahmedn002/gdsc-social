import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdsc_social/features/home/view/state/stories/stories_cubit.dart';
import 'package:gdsc_social/features/story/domain/entities/story_entity.dart';
import 'package:go_router/go_router.dart';

import '../state/stories view/stories_view_cubit.dart';
import 'widgets/stories_page_view.dart';

class StoryScreen extends StatefulWidget {
  const StoryScreen({super.key});

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  late StoryEntity _story;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!_initialized) {
      _story = GoRouterState.of(context).extra as StoryEntity;
      _initialized = true;
    }
    return Scaffold(
      body: BlocBuilder<StoriesCubit, StoriesState>(
        builder: (context, state) {
          if (state is StoriesSuccess) {
            context.read<StoriesViewCubit>().initializeStories(state.stories, _story);
            return StoriesPageView(stories: state.stories, initialStory: _story);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
