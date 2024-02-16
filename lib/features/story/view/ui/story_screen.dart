import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/story/story_cubit.dart';

class StoryScreen extends StatefulWidget {
  final String storyId;
  const StoryScreen({super.key, required this.storyId});

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  @override
  void initState() {
    super.initState();
    context.read<StoryCubit>().getStory(widget.storyId);
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
