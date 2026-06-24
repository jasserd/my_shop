import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_shop/presentation/screens/auth/bloc/auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState());

  void emailChanged(String email) {
    _emitCredentials(email: email, password: state.password);
  }

  void passwordChanged(String password) {
    _emitCredentials(email: state.email, password: password);
  }

  void _emitCredentials({required String email, required String password}) {
    emit(
      state.copyWith(
        email: email,
        password: password,
        isButtonEnabled: email.trim().isNotEmpty && password.trim().isNotEmpty,
      ),
    );
  }
}
