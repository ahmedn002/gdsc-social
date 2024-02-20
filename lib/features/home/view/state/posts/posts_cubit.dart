import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/post_entity.dart';
import '../../../domain/use cases/get_posts_use_case.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  final GetPostsUseCase _getPostsUseCase;

  PostsCubit(this._getPostsUseCase) : super(PostsInitial()) {
    _getPosts();
  }

  Future<void> _getPosts() async {
    emit(PostsLoading());
    final result = await _getPostsUseCase();
    result.fold(
      (failure) => emit(PostsFailure(failure.message)),
      (posts) => emit(PostsSuccess(posts)),
    );
  }
}
