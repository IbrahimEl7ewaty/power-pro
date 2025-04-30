import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:power_pro_app/data/repositories/login_repo/register_repo/register_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepository authRepository;

  RegisterCubit(this.authRepository) : super(RegisterInitial());

  Future<void> register({
    required String username,
    required String email,
    required String password,
  }) async {
    emit(RegisterLoading());
    try {
      await authRepository.register(username, email, password);
      emit(RegisterSuccess());
    } catch (e) {
      emit(RegisterFailure(e.toString()));
    }
  }
}
