import 'package:dakakeen/presentation/auth/login_register_screen.dart';
import 'package:dakakeen/presentation/home/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
      if(snapshot.hasData){
        return const MainScreen();
      }else{
        return const LoginRegisterScreen();
      }
    },),);
  }
}
