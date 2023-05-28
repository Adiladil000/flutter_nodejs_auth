import 'package:flutter/material.dart';
import 'package:flutter_nodejs_auth/providers/user_provider.dart';
import 'package:flutter_nodejs_auth/screens/home_screen.dart';
import 'package:flutter_nodejs_auth/screens/singup_screen.dart';
import 'package:flutter_nodejs_auth/services/auth_services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => UserProvider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Provider.of<UserProvider>(context).user.token.isEmpty ? const SignupScreen() : const HomeScreen());
  }
}
