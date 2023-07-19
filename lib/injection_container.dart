import 'package:clean_and_bloc/features/users/data/data_sources/remote/app_api_service.dart';
import 'package:clean_and_bloc/features/users/data/repository/users_repository_impl.dart';
import 'package:clean_and_bloc/features/users/domain/repository/user_repository.dart';
import 'package:clean_and_bloc/features/users/domain/usecases/get_user.dart';
import 'package:clean_and_bloc/features/users/presentation/bloc/user/remote/remote_user_list_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<AppApiService>(AppApiService(sl()));

  sl.registerSingleton<UserRepository>(UserRepositoryImpl(
    sl(),
  ));

  //UseCases
  sl.registerSingleton<GetUserUseCase>(GetUserUseCase(sl()));

  //Blocs
  sl.registerFactory<RemoteUsersListBloc>(() => RemoteUsersListBloc(sl()));
}
