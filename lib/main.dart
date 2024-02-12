import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdsc_social/core/constants/colors.dart';
import 'package:gdsc_social/core/utils/bloc_observer.dart';
import 'package:gdsc_social/core/utils/general.dart';
import 'package:gdsc_social/core/utils/locator.dart';
import 'package:gdsc_social/features/home/domain/use%20cases/get_posts_use_case.dart';
import 'package:gdsc_social/features/home/view/state/posts/posts_cubit.dart';
import 'package:gdsc_social/features/home/view/state/stories/stories_cubit.dart';
import 'package:get_it/get_it.dart';

import 'features/home/data/repositories/home_repository_implementation.dart';
import 'features/home/domain/use cases/get_stories_use_case.dart';
import 'features/home/view/ui/home_screen.dart';

final GetIt locator = GetIt.instance;

void main() {
  init();
  runApp(const App());
}

void init() {
  Locator.init(); // Initializing singleton instances
  Bloc.observer = CustomBlocObserver();
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiBlocProvider(
        providers: [
          BlocProvider<StoriesCubit>(
            create: (context) => StoriesCubit(
              GetStoriesUseCase(Locator.get<HomeRepositoryImplementation>()),
            ),
          ),
          BlocProvider<PostsCubit>(
            create: (context) => PostsCubit(
              GetPostsUseCase(
                Locator.get<HomeRepositoryImplementation>(),
              ),
            ),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(useMaterial3: true).copyWith(
            scaffoldBackgroundColor: AppColors.background,
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: GeneralUtils.createMaterialColor(AppColors.accent),
            ),
            iconTheme: const IconThemeData(color: AppColors.primaryText),
            splashColor: AppColors.elevation,
            textTheme: TextTheme(
              labelMedium: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryText,
                  ),
              labelSmall: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: AppColors.secondaryText,
                  ),
            ),
          ),
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
