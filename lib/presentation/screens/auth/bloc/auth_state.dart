import 'package:dart_mappable/dart_mappable.dart';
import 'package:my_shop/core/constants/constants.dart';

part 'auth_state.mapper.dart';

@MappableClass()
class AuthState with AuthStateMappable {
  const AuthState({
    this.email = AppSettings.emptyString,
    this.password = AppSettings.emptyString,
    this.isButtonEnabled = false,
  });

  final String email;
  final String password;
  final bool isButtonEnabled;
}
