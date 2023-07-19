import 'package:clean_and_bloc/core/resources/data_state.dart';
import 'package:clean_and_bloc/core/usecase/usecase.dart';
import 'package:clean_and_bloc/features/users/domain/entities/user_details.dart';
import 'package:clean_and_bloc/features/users/domain/repository/user_repository.dart';

class GetUserUseCase
    implements UseCase<DataState<List<UserDetailsEntity>>, int> {
  final UserRepository _userRepository;

  GetUserUseCase(this._userRepository);

  @override
  Future<DataState<List<UserDetailsEntity>>> call(int? page) {
    return _userRepository.getUsersList(page ?? 1);
  }
}
