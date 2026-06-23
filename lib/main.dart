import 'package:flutter/material.dart';
import 'package:my_shop/app.dart';
import 'package:my_shop/core/di/injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  runApp(const MyShopApp());
}
