import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mentasia/constants/global_variables.dart';
import 'package:mentasia/firebase_options.dart';
import 'package:mentasia/models/model_theme.dart';
import 'package:mentasia/constants/router.dart';
import 'package:mentasia/views/home.dart';
import 'package:mentasia/views/splash_screen.dart';
import 'package:provider/provider.dart';

import 'constants/themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initializing firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

bool iconBool = false;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => ModelTheme()),
      child: Consumer<ModelTheme>(
        builder: ((context, value, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: value.isDark ? darkTheme : lighTheme,
            initialRoute: SplashScreen.route,
            routes: getRoutes(),
          );
        }),
      ),
    );
  }
}
