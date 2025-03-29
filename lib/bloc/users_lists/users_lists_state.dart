part of 'users_lists_bloc.dart';

sealed class UsersListsState extends Equatable {
  final data;
  const UsersListsState(this.data);

  @override
  List<Object> get props => [];
}

final class UsersListsInitial extends UsersListsState {
  const UsersListsInitial(super.data);
}

final class UsersListsLoadingState extends UsersListsState {
  const UsersListsLoadingState(super.data);
}

final class UsersListsLoadedState extends UsersListsState {
  final int page;
  final int per_page;
  final int total;
  final int total_pages;
  final List<UsersList> data;

  const UsersListsLoadedState({
    required this.data,
    required this.page,
    required this.per_page,
    required this.total,
    required this.total_pages,
  }) : super(data);
  @override
  List<Object> get props => [data, page, per_page, total, total_pages];
}

final class UsersListsLoadingErrorState extends UsersListsState {
  final String error;
  const UsersListsLoadingErrorState({required this.error}) : super(null);

  @override
  List<Object> get props => [error];
}
