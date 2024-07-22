import 'package:dakakeen/presentation/auth/login_screen.dart';
import 'package:dakakeen/presentation/auth/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/auth_provider.dart';
import '../../injection_container.dart';

class LoginRegisterScreen extends StatelessWidget {
  const LoginRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        return authProvider.showLoginScreen ? const LoginScreen() : const SignupScreen();
      },
    );
  }
}
