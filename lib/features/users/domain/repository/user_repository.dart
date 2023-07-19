import 'package:clean_and_bloc/core/resources/data_state.dart';
import 'package:clean_and_bloc/features/users/domain/entities/user_details.dart';

abstract class UserRepository {
  Future<DataState<List<UserDetailsEntity>>> getUsersList(int page);
}
