import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/post_entity.dart';
import '../../../domain/use cases/get_posts_use_case.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  final GetPostsUseCase getPostsUseCase;

  PostsCubit(this.getPostsUseCase) : super(PostsInitial());

  Future<void> getPosts() async {
    emit(PostsLoading());
    final result = await getPostsUseCase();
    result.fold(
      (failure) => emit(PostsFailure(failure.message)),
      (posts) => emit(PostsSuccess(posts)),
    );
  }
}
