import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdsc_social/core/constants/colors.dart';
import 'package:gdsc_social/core/routes/route_manager.dart';
import 'package:gdsc_social/core/utils/bloc_observer.dart';
import 'package:gdsc_social/core/utils/general.dart';
import 'package:gdsc_social/core/utils/locator.dart';
import 'package:gdsc_social/features/home/domain/use%20cases/get_popular_hashtags_use_case.dart';
import 'package:gdsc_social/features/home/domain/use%20cases/get_posts_use_case.dart';
import 'package:gdsc_social/features/home/view/state/hashtags/hashtags_cubit.dart';
import 'package:gdsc_social/features/home/view/state/posts/posts_cubit.dart';
import 'package:gdsc_social/features/home/view/state/stories/stories_cubit.dart';
import 'package:gdsc_social/features/story/view/state/stories%20view/stories_view_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import 'features/home/data/repositories/home_repository_implementation.dart';
import 'features/home/domain/use cases/get_stories_use_case.dart';
import 'features/home/view/ui/home_screen.dart';
import 'features/splash/view/ui/splash_screen.dart';
import 'features/story/view/ui/story_screen.dart';

final GetIt locator = GetIt.instance;

void main() {
  init();
  runApp(const App());
}

void init() {
  Locator.init(); // Initializing singleton instances
  Bloc.observer = CustomBlocObserver();
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: Routes.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: Routes.home,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: Routes.story,
      builder: (context, state) => const StoryScreen(),
    ),
  ],
);

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
              GetPostsUseCase(Locator.get<HomeRepositoryImplementation>()),
            ),
          ),
          BlocProvider(
            create: (context) => HashtagsCubit(
              GetPopularHashtagsUseCase(Locator.get<HomeRepositoryImplementation>()),
            ),
          ),
          BlocProvider<StoriesViewCubit>(
            create: (context) => StoriesViewCubit(),
          ),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(useMaterial3: true).copyWith(
            scaffoldBackgroundColor: AppColors.background,
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: GeneralUtils.createMaterialColor(AppColors.accent),
            ),
            iconTheme: const IconThemeData(color: AppColors.primaryText),
            inputDecorationTheme: const InputDecorationTheme(
              iconColor: AppColors.primaryText,
            ),
            splashColor: AppColors.elevation,
            textTheme: TextTheme(
              labelMedium: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryText,
                  ),
              labelSmall: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: AppColors.secondaryText,
                  ),
              titleMedium: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryText,
                  ),
            ),
          ),
          routerConfig: _router,
        ),
      ),
    );
  }
}
