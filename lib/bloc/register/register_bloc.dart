import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/request/register_request_model.dart';
import '../../data/models/response/register_response_model.dart';
import '../../data/repository/auth_repository.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepository repository;

  RegisterBloc(this.repository) : super(RegisterInitial()) {
    on<DoRegisterEvent>((event, emit) async {
      emit(RegisterLoading());
      final result = await repository.register(event.model);
      result.fold(
        (error) => emit(RegisterError(message: error)),
        (data) => emit(RegisterLoaded(model: data)),
      );
    });
  }
}
