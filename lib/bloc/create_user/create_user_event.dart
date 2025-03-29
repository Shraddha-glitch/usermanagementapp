part of 'create_user_bloc.dart';

sealed class CreateUserEvent extends Equatable {
  const CreateUserEvent();

  @override
  List<Object> get props => [];
}

final class CreateUserPressedEvent extends CreateUserEvent {
  final String name;
  final String job;
  const CreateUserPressedEvent({required this.name, required this.job});
  @override
  List<Object> get props => [name, job];
}
