import 'package:flutter/material.dart';
import 'package:placement_app/views/experiences_screen.dart';
import 'package:placement_app/views/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:placement_app/views/login_screen.dart';
import 'package:placement_app/views/register_screen.dart';
import 'package:placement_app/views/submit_experiences_screen.dart';
import 'package:placement_app/views/welcome_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
          '/login': (context) => const LoginScreen(),
          '/register': (context) => const RegisterScreen(),
          '/experiences': (context) => const ExperiencesScreen(),
          '/submitExperience': (context) => const SubmitExperiencesScreen(),
          '/welcome': (context) => const WelcomeScreen()
        });
  }
}
