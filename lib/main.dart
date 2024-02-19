import 'package:flutter/material.dart';
import 'package:shopsync/auth/auth.dart';
import 'package:shopsync/auth/login_or_register.dart';
import 'package:shopsync/firebase_options.dart';
import 'package:shopsync/pages/home_page.dart';
import 'package:shopsync/pages/profile_page.dart';
import 'package:shopsync/pages/user_page.dart';
import 'package:shopsync/theme/dark_mode.dart';
import 'package:shopsync/theme/light_mode.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthPage(),
      theme: lightMode,
      darkTheme: darkMode,
      routes: {
        '/login_register_page': (context) => const LoginOrRegister(),
        '/home_page': (context) => const HomePage(),
        '/profile_page': (context) => const ProfilePage(),
        '/users_page': (context) => const UsersPage()
      },
    );
  }
}
