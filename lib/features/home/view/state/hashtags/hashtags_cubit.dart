import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/hashtag_entity.dart';
import '../../../domain/use cases/get_popular_hashtags_use_case.dart';

part 'hashtags_state.dart';

class HashtagsCubit extends Cubit<HashtagsState> {
  final GetPopularHashtagsUseCase getPopularHashtagsUseCase;

  HashtagsCubit(this.getPopularHashtagsUseCase) : super(HashtagsInitial()) {
    _getPopularHashtags();
  }

  Future<void> _getPopularHashtags() async {
    emit(HashtagsLoading());
    final result = await getPopularHashtagsUseCase();
    result.fold(
      (failure) => emit(HashtagsFailure(failure.message)),
      (hashtags) => emit(HashtagsSuccess(hashtags)),
    );
  }
}
