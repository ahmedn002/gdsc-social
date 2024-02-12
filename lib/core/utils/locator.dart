import 'dart:developer';

import 'package:get_it/get_it.dart';

import '../../features/home/data/repositories/home_repository_implementation.dart';
import '../../features/home/data/sources/home_local_data_source.dart';
import '../../features/home/data/sources/home_remote_data_source.dart';

class Locator {
  static final GetIt _getIt = GetIt.instance;

  static void init() {
    final HomeRepositoryImplementation homeRepositoryImplementationInstance = HomeRepositoryImplementation(
      remoteDataSource: HomeRemoteDataSourceImplementation(),
      localDataSource: HomeLocalDataSourceImplementation(),
    );

    // Registering the instance
    _getIt.registerSingleton<HomeRepositoryImplementation>(homeRepositoryImplementationInstance);

    // Checking if the instance is registered
    log(_getIt.isRegistered<HomeRepositoryImplementation>().toString());
  }

  static T get<T extends Object>() {
    return _getIt.get<T>();
  }
}
