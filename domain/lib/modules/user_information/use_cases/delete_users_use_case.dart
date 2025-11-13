import 'package:domain/core/usecase.dart';
import 'package:domain/modules/user_information/user_information_repository.dart';

class DeleteUsersUseCase extends UseCaseNoEitherNoParamsNoStream<void> {
  final UserInformationRepository userInformationRepository;

  DeleteUsersUseCase({required this.userInformationRepository});

  @override
  Future<void> call() async {
    userInformationRepository.deleteAllUsers();
  }
}
