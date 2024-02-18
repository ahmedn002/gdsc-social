import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdsc_social/features/story/view/state/story/story_cubit.dart';

import '../widgets/story_circle_hero.dart';

class StoryScreenBlocBuilder extends StatelessWidget {
  const StoryScreenBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoryCubit, StoryState>(
      builder: (context, state) {
        if (state is StoryLoading) {
          return const CircularProgressIndicator();
        } else if (state is StorySuccess) {
          return Column(
            children: [
              StoryCircleHero(story: state.story),
            ],
          );
        } else if (state is StoryFailure) {
          return Text(state.message);
        }
        return const SizedBox();
      },
    );
  }
}
