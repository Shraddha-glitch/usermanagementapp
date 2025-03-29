part of 'delete_user_bloc.dart';

sealed class DeleteUserState extends Equatable {
  const DeleteUserState();

  @override
  List<Object> get props => [];
}

final class DeleteUserInitial extends DeleteUserState {}

final class DeleteUserLoadingState extends DeleteUserState {}

final class DeleteUserSuccessState extends DeleteUserState {
  final int id;
  const DeleteUserSuccessState({required this.id});
}

final class DeleteUserErrorState extends DeleteUserState {
  final String error;

  const DeleteUserErrorState({required this.error});
  @override
  List<Object> get props => [error];
}
