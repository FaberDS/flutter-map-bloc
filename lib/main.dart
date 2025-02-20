import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart' as Environment;
import 'package:map_bloc/injection.dart';
import 'package:map_bloc/presentation/core/app_widget.dart';
import 'package:map_bloc/presentation/map/map_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection("DEV");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const AppWidget();
  }
}
