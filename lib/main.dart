import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:olinio_test/features/app.dart';
import 'package:olinio_test/repository/contact_service.dart';

final getIt = GetIt.instance;

void main() {
  getIt.registerSingleton<ContactService>(ContactService());
  runApp(const App());
}
