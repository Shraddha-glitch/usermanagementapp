import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:usermanagementapp/repositories/users.dart';

part 'create_user_event.dart';
part 'create_user_state.dart';

class CreateUserBloc extends Bloc<CreateUserEvent, CreateUserState> {
  final UserRepository userRepository;
  CreateUserBloc({required this.userRepository}) : super(CreateUserInitial()) {
    on<CreateUserPressedEvent>((event, emit) async {
      try {
        emit(CreateUserLoadingState());
        final String? id = await userRepository.createUser(
          event.name,
          event.job,
        );
        if (id != null) {
          emit(CreateUserSuccessState());
        } else {
          emit(CreateUserErrorState(error: 'Failed to create user'));
        }
      } catch (error) {
        emit(CreateUserErrorState(error: error.toString()));
      }
    });
  }
}
