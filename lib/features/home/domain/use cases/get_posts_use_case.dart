import 'package:dartz/dartz.dart';
import 'package:gdsc_social/core/use%20case/no_params.dart';
import 'package:gdsc_social/core/use%20case/use_case.dart';
import 'package:gdsc_social/features/home/domain/entities/post_entity.dart';
import 'package:gdsc_social/features/home/domain/repositories/home_repository_abstraction.dart';

import '../../../../core/errors/failure.dart';

class GetPostsUseCase extends UseCase<List<PostEntity>, NoParams> {
  final HomeRepository repository;

  GetPostsUseCase(this.repository);

  @override
  Future<Either<Failure, List<PostEntity>>> call([NoParams? params]) async {
    return await repository.getPosts();
  }
}
