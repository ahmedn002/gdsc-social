import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdsc_social/features/home/view/state/hashtags/hashtags_cubit.dart';
import 'package:gdsc_social/features/home/view/ui/widgets/home_right_side_bar.dart';

class RightSideBarSectionBlocBuilder extends StatelessWidget {
  const RightSideBarSectionBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HashtagsCubit, HashtagsState>(
      builder: (context, state) {
        if (state is HashtagsLoading) {
          return const CircularProgressIndicator();
        } else if (state is HashtagsFailure) {
          return Text(state.message);
        } else if (state is HashtagsSuccess) {
          return HomeRightSideBar(popularHashtags: state.hashtags);
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
