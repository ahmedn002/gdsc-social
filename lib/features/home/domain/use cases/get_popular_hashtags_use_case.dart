import 'package:dartz/dartz.dart';
import 'package:gdsc_social/core/errors/failure.dart';
import 'package:gdsc_social/core/use%20case/no_params.dart';
import 'package:gdsc_social/core/use%20case/use_case.dart';
import 'package:gdsc_social/features/home/domain/entities/hashtag_entity.dart';

import '../repositories/home_repository_abstraction.dart';

class GetPopularHashtagsUseCase extends UseCase<List<HashTagEntity>, NoParams> {
  final HomeRepository repository;

  GetPopularHashtagsUseCase(this.repository);

  @override
  Future<Either<Failure, List<HashTagEntity>>> call([NoParams? params]) async {
    return await repository.getPopularHashtags();
  }
}
