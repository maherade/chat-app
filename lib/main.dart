import 'package:chat/screens/create_account_screen/create_account.dart';
import 'package:chat/screens/login_screen/login_view.dart';
import 'package:chat/screens/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        CreateAccount.routeName: (_) => CreateAccount(),
        LoginScreen.routeName: (_) => LoginScreen(),
        SplashScreen.routeName: (_) => SplashScreen(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
