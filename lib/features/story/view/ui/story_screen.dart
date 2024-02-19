import 'package:flutter/material.dart';
import 'package:gdsc_social/features/story/domain/entities/story_entity.dart';
import 'package:gdsc_social/features/story/view/ui/components/story_screen_body.dart';
import 'package:go_router/go_router.dart';

class StoryScreen extends StatefulWidget {
  const StoryScreen({super.key});

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  late StoryEntity _story;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _story = GoRouterState.of(context).extra as StoryEntity;

    return Scaffold(
      body: StoryScreenBody(story: _story),
    );
  }
}
