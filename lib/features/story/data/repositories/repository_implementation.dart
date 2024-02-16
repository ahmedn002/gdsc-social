import 'package:dartz/dartz.dart';
import 'package:gdsc_social/core/errors/failure.dart';
import 'package:gdsc_social/features/story/data/sources/story_local_data_source.dart';
import 'package:gdsc_social/features/story/data/sources/story_remote_data_source.dart';
import 'package:gdsc_social/features/story/domain/repositories/story_repository_abstraction.dart';

import '../../domain/entities/story_entity.dart';

class StoryRepositoryImplementation extends StoryRepository {
  final StoryLocalDataSource _localDataSource;
  final StoryRemoteDataSource _remoteDataSource;

  StoryRepositoryImplementation({
    required StoryLocalDataSource localDataSource,
    required StoryRemoteDataSource remoteDataSource,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource;

  @override
  Future<Either<Failure, StoryEntity?>> getStory(String id) async {
    try {
      final story = await _remoteDataSource.getStory(id);
      return Right(story);
    } on Exception catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
