import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:power_pro_app/data/repositories/login_repo/login_repo.dart';
import 'package:power_pro_app/data/repositories/login_repo/register_repo/register_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo authRepository;

  LoginCubit(this.authRepository) : super(LoginInitial());

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    try {
      await authRepository.login(email: email, password: password);
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
