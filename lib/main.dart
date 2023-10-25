import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ktmattend/pages/auth_page.dart';
import 'package:ktmattend/pages/home_page.dart';
import 'package:ktmattend/pages/add_page.dart';
import 'package:ktmattend/pages/report_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthPage(),
      routes: {
        '/home': (context) => const HomePage(),
        '/add': (context) => const AddPage(),
        '/report': (context) =>
            const ReportPage(), // Add other routes as needed
      },
    );
  }
}
