import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test1011/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

  runApp(
    const MyApp(),
  );
}
