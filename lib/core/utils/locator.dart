import 'package:gdsc_social/features/story/data/repositories/repository_implementation.dart';
import 'package:gdsc_social/features/story/data/sources/story_remote_data_source.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/repositories/home_repository_implementation.dart';
import '../../features/home/data/sources/home_local_data_source.dart';
import '../../features/home/data/sources/home_remote_data_source.dart';
import '../../features/story/data/sources/story_local_data_source.dart';

class Locator {
  static final GetIt _getIt = GetIt.instance;

  static void init() {
    final HomeRepositoryImplementation homeRepositoryImplementationInstance = HomeRepositoryImplementation(
      remoteDataSource: HomeRemoteDataSourceImplementation(),
      localDataSource: HomeLocalDataSourceImplementation(),
    );
    _getIt.registerSingleton<HomeRepositoryImplementation>(homeRepositoryImplementationInstance);

    final StoryRepositoryImplementation storyRepositoryImplementationInstance = StoryRepositoryImplementation(
      remoteDataSource: StoryRemoteDataSourceImplementation(),
      localDataSource: StoryLocalDataSourceImplementation(),
    );
    _getIt.registerSingleton<StoryRepositoryImplementation>(storyRepositoryImplementationInstance);
  }

  static T get<T extends Object>() {
    return _getIt.get<T>();
  }
}
