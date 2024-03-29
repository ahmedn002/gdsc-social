import 'package:dartz/dartz.dart';
import 'package:gdsc_social/features/home/domain/repositories/home_repository_abstraction.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/use case/no_params.dart';
import '../../../../core/use case/use_case.dart';
import '../../../story/domain/entities/story_entity.dart';

class GetStoriesUseCase extends UseCase<List<StoryEntity>, NoParams> {
  final HomeRepository homeRepository;

  GetStoriesUseCase(this.homeRepository);

  @override
  Future<Either<Failure, List<StoryEntity>>> call([NoParams? params]) async {
    return await homeRepository.getStories();
  }
}
