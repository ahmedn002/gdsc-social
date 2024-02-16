import 'package:dartz/dartz.dart';
import 'package:gdsc_social/core/errors/error_categorizer.dart';
import 'package:gdsc_social/core/errors/failure.dart';
import 'package:gdsc_social/features/home/domain/entities/post_entity.dart';
import 'package:gdsc_social/features/home/domain/entities/story_entity.dart';

import '../../domain/repositories/home_repository_abstraction.dart';
import '../sources/home_local_data_source.dart';
import '../sources/home_remote_data_source.dart';

class HomeRepositoryImplementation implements HomeRepository {
  final HomeRemoteDataSource _remoteDataSource;
  final HomeLocalDataSource _localDataSource;

  HomeRepositoryImplementation({
    required HomeRemoteDataSource remoteDataSource,
    required HomeLocalDataSource localDataSource,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource;

  @override
  Future<Either<Failure, List<StoryEntity>>> getStories() async {
    try {
      final stories = await _remoteDataSource.getStories();
      return Right(stories);
    } on Exception catch (e) {
      return Left(ErrorCategorizer.categorizeError(e));
    }
  }

  @override
  Future<Either<Failure, List<PostEntity>>> getPosts() async {
    try {
      final posts = await _remoteDataSource.getPosts();
      return Right(posts);
    } on Exception catch (e) {
      return Left(ErrorCategorizer.categorizeError(e));
    }
  }
}
