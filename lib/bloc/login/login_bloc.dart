import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/request/login_request_model.dart';
import '../../data/models/response/login_response_model.dart';
import '../../data/repository/auth_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository repository;

  LoginBloc(this.repository) : super(LoginInitial()) {
    on<DoLoginEvent>((event, emit) async {
      emit(LoginLoading());
      final result = await repository.login(event.model);
      result.fold(
        (error) => emit(LoginError(message: error)),
        (data) => emit(LoginLoaded(model: data)),
      );
    });
  }
}
