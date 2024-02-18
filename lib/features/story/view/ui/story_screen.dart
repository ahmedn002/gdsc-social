import 'package:flutter/material.dart';
import 'package:gdsc_social/features/story/view/ui/components/story_screen_bloc_builder.dart';

class StoryScreen extends StatefulWidget {
  const StoryScreen({super.key});

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  @override
  void initState() {
    super.initState();
    // context.read<StoryCubit>().getStory(widget.storyId);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          StoryScreenBlocBuilder(),
        ],
      ),
    );
  }
}
