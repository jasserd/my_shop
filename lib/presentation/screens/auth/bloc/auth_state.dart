import 'package:dart_mappable/dart_mappable.dart';

part 'auth_state.mapper.dart';

@MappableClass()
class AuthState with AuthStateMappable {
  const AuthState({
    this.email = '',
    this.password = '',
    this.isButtonEnabled = false,
  });

  final String email;
  final String password;
  final bool isButtonEnabled;
}
