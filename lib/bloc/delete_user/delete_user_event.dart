part of 'delete_user_bloc.dart';

sealed class DeleteUserEvent extends Equatable {
  const DeleteUserEvent();

  @override
  List<Object> get props => [];
}

final class DeleteUserPressedEvent extends DeleteUserEvent {
  final int id;
  const DeleteUserPressedEvent({required this.id});
}
