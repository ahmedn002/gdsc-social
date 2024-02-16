import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdsc_social/features/home/view/state/posts/posts_cubit.dart';

import '../widgets/posts/post_list.dart';

class PostsSectionBlocBuilder extends StatelessWidget {
  const PostsSectionBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsCubit, PostsState>(
      builder: (context, state) {
        if (state is PostsLoading) {
          return const SliverToBoxAdapter(child: CircularProgressIndicator());
        } else if (state is PostsSuccess) {
          return PostList(posts: state.posts);
        } else if (state is PostsFailure) {
          return SliverToBoxAdapter(child: Text(state.message));
        } else {
          return const SliverToBoxAdapter(child: SizedBox.shrink());
        }
      },
    );
  }
}
