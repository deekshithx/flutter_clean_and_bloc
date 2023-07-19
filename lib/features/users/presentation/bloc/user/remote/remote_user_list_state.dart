import 'package:clean_and_bloc/features/users/domain/entities/user_details.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class RemoteUsersListState extends Equatable {
  final List<UserDetailsEntity>? userList;
  final DioException? exception;
  final bool? isEnd;

  const RemoteUsersListState({this.userList, this.exception, this.isEnd});

  @override
  List<Object> get props => [userList!, exception!];
}

class RemoteUsersListLoading extends RemoteUsersListState {
  const RemoteUsersListLoading();
}

class RemoteUsersListDone extends RemoteUsersListState {
  const RemoteUsersListDone(List<UserDetailsEntity> userList, bool isEnd)
      : super(userList: userList, isEnd: isEnd);
}

class RemoteUsersListError extends RemoteUsersListState {
  const RemoteUsersListError(DioException exception)
      : super(exception: exception);
}
