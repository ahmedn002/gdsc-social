import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/use case/use_case.dart';
import '../entities/story_entity.dart';
import '../repositories/story_repository_abstraction.dart';

class GetStoryUseCase implements UseCase<StoryEntity?, String> {
  final StoryRepository _repository;

  GetStoryUseCase(this._repository);

  @override
  Future<Either<Failure, StoryEntity?>> call([String? params]) {
    assert(params != null);
    return _repository.getStory(params!);
  }
}
