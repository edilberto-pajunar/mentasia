import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mentasia/constants/global_variables.dart';
import 'package:mentasia/firebase_options.dart';
import 'package:mentasia/routing/router.dart';
import 'package:mentasia/screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initializing firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Helvetica",
        scaffoldBackgroundColor: tBgColor,
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: tPrimaryColor,
        ),
      ),
      initialRoute: SplashScreen.route,
      routes: getRoutes(),
    );
  }
}
