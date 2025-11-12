import 'package:domain/core/usecase.dart';

import '../auth_repository.dart';

class DeleteTokensUseCase extends UseCaseNoEitherNoParamsNoStream<void> {
  final AuthRepository authRepository;

  DeleteTokensUseCase({required this.authRepository});

  @override
  Future<void> call() async {
    authRepository.deleteTokens();
  }
}
