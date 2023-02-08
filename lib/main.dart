import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:smart_medic/iconbtn/ambulan.dart';
import 'package:smart_medic/iconbtn/bantuan.dart';
import 'package:smart_medic/iconbtn/daftar.dart';
import 'package:smart_medic/iconbtn/daftar_penyakit.dart';
import 'package:smart_medic/iconbtn/hasil_lab.dart';
import 'package:smart_medic/iconbtn/kamar.dart';
import 'package:smart_medic/iconbtn/sholat.dart';
import 'package:smart_medic/pages/auth_page.dart';
import 'package:smart_medic/pages/pasien/old_pasien.dart';
import '../pages/pasien/pasien.dart';
import '../pages/login/login.dart';
import '../pages/my_home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 2))
        .then((value) => {FlutterNativeSplash.remove()});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
      routes: {
        LoginPage.routeName: (context) => LoginPage(),
        MyHome.routeName: (context) => MyHome(),
        Pasien.routeName: (context) => Pasien(),
        AuthPage.routeName:(context) => AuthPage(),
        Logins.routeName:(context) => Logins(),

        Bantuan.routeName:(context) => Bantuan(),
        Sholat.routeName:(context) => Sholat(),
        HasilLab.routeName:(context) => HasilLab(),
        Ambulan.routeName:(context) => Ambulan(),
        Kamar.routeName:(context) => Kamar(),
        Daftar.routeName:(context) => Daftar(),
        DaftarPenyakit.routeName:(context) => DaftarPenyakit(),
        
      },
    );
  }
}
