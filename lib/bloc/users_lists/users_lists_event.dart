part of 'users_lists_bloc.dart';

sealed class UsersListsEvent extends Equatable {
  const UsersListsEvent();

  @override
  List<Object> get props => [];
}

final class ViewUsersListsPressedEvent extends UsersListsEvent {
  const ViewUsersListsPressedEvent();
  @override
  List<Object> get props => [];
}

final class LoadMoreUsersListsPressedEvent extends UsersListsEvent {
  const LoadMoreUsersListsPressedEvent();
  @override
  List<Object> get props => [];
}

class UpdateUsersListsEvent extends UsersListsEvent {
  final List<UsersList> updatedUsers;

  const UpdateUsersListsEvent(this.updatedUsers);
}
