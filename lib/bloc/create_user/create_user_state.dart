part of 'create_user_bloc.dart';

sealed class CreateUserState extends Equatable {
  const CreateUserState();

  @override
  List<Object> get props => [];
}

final class CreateUserInitial extends CreateUserState {}

final class CreateUserLoadingState extends CreateUserState {
  const CreateUserLoadingState();
}

final class CreateUserSuccessState extends CreateUserState {
  const CreateUserSuccessState();
}

final class CreateUserErrorState extends CreateUserState {
  final String error;
  const CreateUserErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
