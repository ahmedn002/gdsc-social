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
      body: StoryScreenBody(story: _story),
    );
  }
}
