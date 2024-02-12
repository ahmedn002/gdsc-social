import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdsc_social/features/home/view/state/stories/stories_cubit.dart';

import '../widgets/stories/stories_list.dart';

class StoriesSectionBlocBuilder extends StatelessWidget {
  const StoriesSectionBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoriesCubit, StoriesState>(
      builder: (context, state) {
        if (state is StoriesLoading) {
          return const CircularProgressIndicator();
        } else if (state is StoriesSuccess) {
          return StoriesSection(stories: state.stories);
        } else if (state is StoriesFailure) {
          return Text(state.message);
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
