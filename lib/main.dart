import 'package:chat/providers/my_provider.dart';
import 'package:chat/screens/add_room/add_room_screen.dart';
import 'package:chat/screens/create_account_screen/create_account.dart';
import 'package:chat/screens/home/home.dart';
import 'package:chat/screens/login_screen/login_view.dart';
import 'package:chat/screens/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
      create: (context) => MyProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        AddRoomScreen.routeName: (_) => AddRoomScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
        CreateAccount.routeName: (_) => CreateAccount(),
        LoginScreen.routeName: (_) => LoginScreen(),
        SplashScreen.routeName: (_) => SplashScreen(),
      },
      initialRoute: provider.firebaseUser != null
          ? HomeScreen.routeName
          : SplashScreen.routeName,
    );
  }
}
