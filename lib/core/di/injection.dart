import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:my_shop/core/di/injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => getIt.init();
