import 'package:clean_and_bloc/core/resources/data_state.dart';
import 'package:clean_and_bloc/features/users/domain/entities/user_details.dart';
import 'package:clean_and_bloc/features/users/domain/usecases/get_user.dart';
import 'package:clean_and_bloc/features/users/presentation/bloc/user/remote/remote_user_list_event.dart';
import 'package:clean_and_bloc/features/users/presentation/bloc/user/remote/remote_user_list_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteUsersListBloc
    extends Bloc<RemoteUsersListEvent, RemoteUsersListState> {
  final GetUserUseCase _getUserUseCase;
  List<UserDetailsEntity> userList = [];
  int currentPage = 1;
  bool isLoading = false, lastPage = false;

  RemoteUsersListBloc(this._getUserUseCase)
      : super(const RemoteUsersListLoading()) {
    on<GetUsersList>(_onGetUsersList);
  }

  Future<void> _onGetUsersList(
    GetUsersList event,
    Emitter<RemoteUsersListState> emit,
  ) async {
    if (!isLoading && !lastPage) {
      isLoading = true;
      try {
        final dataState = await _getUserUseCase(currentPage);
        if (dataState is DataSuccess && dataState.data != null) {
          if (dataState.data!.isEmpty) {
            lastPage = true;
          }
          final updatedUserList = [...userList, ...dataState.data!];
          currentPage++;
          userList = updatedUserList;
          emit(const RemoteUsersListLoading());
          emit(RemoteUsersListDone(userList, dataState.data!.isEmpty));
        } else if (dataState is DataFailed) {
          if (dataState.exception is DioException) {
            emit(RemoteUsersListError(dataState.exception as DioException));
          } else if (dataState.exception is Exception) {
            emit(RemoteUsersListError(DioException(
              error: dataState.exception.toString(),
              requestOptions: RequestOptions(path: ''),
            )));
          }
        }
      } catch (e) {
        emit(RemoteUsersListError(DioException(
          error: e.toString(),
          requestOptions: RequestOptions(path: ''),
        )));
      } finally {
        isLoading = false;
      }
    }
  }
}
