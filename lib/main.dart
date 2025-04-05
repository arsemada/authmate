import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// Ensure this file contains the AccountPage class or replace with the correct import.

import 'pages/login_page.dart'; // Ensure this file contains the LoginPage class or replace with the correct import.

// Ensure this file contains the LoginPage class or replace with the correct import.

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Page'),
      ),
      body: const Center(
        child: Text('Welcome to the Account Page!'),
      ),
    );
  }
}

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://fipyttvwuddvgjjqvchx.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZpcHl0dHZ3dWRkdmdqanF2Y2h4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDM3OTQwOTcsImV4cCI6MjA1OTM3MDA5N30.RbkjzvHSSdJVG8o29IroVdYvjrmfl7aWvLrPeRMojIs',
  );
  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Supabase Flutter',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.green,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.green,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.green,
          ),
        ),
      ),
      home: supabase.auth.currentSession == null
          ? const LoginPage() // Ensure LoginPage is defined in the imported file.
          : const AccountPage(),
    );
  }
}

extension ContextExtension on BuildContext {
  void showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError
            ? Theme.of(this).colorScheme.error
            : Theme.of(this).snackBarTheme.backgroundColor,
      ),
    );
  }
}