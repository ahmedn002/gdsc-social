import 'package:dartz/dartz.dart';
import 'package:gdsc_social/core/errors/failure.dart';

import '../entities/story_entity.dart';

abstract class StoryRepository {
  Future<Either<Failure, StoryEntity?>> getStory(String id);
}
