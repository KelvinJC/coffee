import 'package:flutter/material.dart';
import 'auth/main_page.dart';
import 'package:coffee_app/config/app_router.dart';
import 'package:coffee_app/pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:coffee_app/firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
      // home: HomePage(),
      theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.orange,
      ),

      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: HomePage.routeName,

    );
  }
}

