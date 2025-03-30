// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:usermanagementapp/repositories/users.dart';

part 'delete_user_event.dart';
part 'delete_user_state.dart';

class DeleteUserBloc extends Bloc<DeleteUserEvent, DeleteUserState> {
  final UserRepository userRepository;

  DeleteUserBloc({required this.userRepository}) : super(DeleteUserInitial()) {
    on<DeleteUserPressedEvent>((event, emit) async {
      emit(DeleteUserLoadingState());
      try {
        bool isSuccess = await userRepository.deleteUser(event.id);
        if (isSuccess) {
          emit(DeleteUserSuccessState(id: event.id));
        } else {
          emit(DeleteUserErrorState(error: 'Something went wrong'));
        }
      } catch (e) {
        emit(DeleteUserErrorState(error: e.toString()));
      }
    });
  }
}
