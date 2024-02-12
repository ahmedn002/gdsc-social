import 'package:dartz/dartz.dart';
import 'package:gdsc_social/features/home/domain/entities/story_entity.dart';

import '../../../../core/errors/failure.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<StoryEntity>>> getStories();
}
