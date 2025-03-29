// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:usermanagementapp/models/model.dart';
import 'package:usermanagementapp/repositories/users_lists.dart';

part 'users_lists_event.dart';
part 'users_lists_state.dart';

class UsersListsBloc extends Bloc<UsersListsEvent, UsersListsState> {
  final ViewUsersListsRepository viewUsersListsRepository;
  int pageNumber = 0;
  bool hasMore = true;
  int pageInfo = 1;
  ViewUsersListsModel? viewUsersListsModel;

  UsersListsBloc({required this.viewUsersListsRepository})
    : super(UsersListsInitial(null)) {
    on<ViewUsersListsPressedEvent>((event, emit) async {
      emit(UsersListsLoadingState(null));
      pageNumber = 1;
      try {
        final viewUsersModelLists = await viewUsersListsRepository
            .getUsersLists(pageNumber);
        pageInfo = viewUsersModelLists!.page;
        emit(
          UsersListsLoadedState(
            page: viewUsersModelLists.page,
            per_page: viewUsersModelLists.per_page,
            total: viewUsersModelLists.total,
            total_pages: viewUsersModelLists.total_pages,
            data: viewUsersModelLists.data.asList(),
          ),
        );
      } catch (e) {
        emit(UsersListsLoadingErrorState(error: e.toString()));
      }
    });
    on<LoadMoreUsersListsPressedEvent>((event, emit) async {
      final viewUsersModelLists = await viewUsersListsRepository.getUsersLists(
        pageNumber,
      );
      if (pageNumber < viewUsersModelLists!.total_pages) {
        pageNumber++;
        final viewUsersModelLists = await viewUsersListsRepository
            .getUsersLists(pageNumber);
        pageInfo = viewUsersModelLists!.page;
        emit(
          UsersListsLoadedState(
            page: viewUsersModelLists.page,
            per_page: viewUsersModelLists.per_page,
            total: viewUsersModelLists.total,
            total_pages: viewUsersModelLists.total_pages,
            data: [...state.data, ...viewUsersModelLists.data.asList()],
          ),
        );
      }
    });
  }
}
