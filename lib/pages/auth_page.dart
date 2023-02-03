import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smart_medic/pages/login/login.dart';
import 'package:smart_medic/pages/my_home.dart';
import 'package:smart_medic/pages/pasien/pasien.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});
  static const routeName = '/auth';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user is logged in
          if(snapshot.hasData) {
            return MyHome();
          }
          // user is not logged in
          else{
            return LoginPage();
          }
        },
      ),
    );
  }
}