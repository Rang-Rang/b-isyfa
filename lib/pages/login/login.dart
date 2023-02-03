import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_medic/pages/my_home.dart';
import 'package:smart_medic/pages/pasien/old_pasien.dart';
import 'package:smart_medic/pages/pasien/pasien.dart';

class LoginPage extends StatelessWidget {
  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Smart Medic"),
      // )
      appBar: null,
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset("assets/icon.png"),
            ),
            Container(
              height: 20,
            ),
            Text("Daftarkan Pasien"),
            Container(
              height: 25,
            ),
            TextButton(
              onPressed: (() {
                Navigator.of(context).pushReplacementNamed(Pasien.routeName);
              }),
              child: ListTile(
                autofocus: false,
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.playlist_add,
                      color: Colors.white,
                    ),
                  ],
                ),
                title: Text(
                  "Pasien baru",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                subtitle: Text(
                  "Pasien belum memiliki rekam medis",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              style: TextButton.styleFrom(
                  backgroundColor: Colors.deepPurple, shape: StadiumBorder()),
            ),
            Container(
              height: 20,
            ),
            OutlinedButton(
              onPressed: (() {
                Navigator.of(context).pushReplacementNamed(Logins.routeName);
              }),
              child: ListTile(
                autofocus: false,
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.personal_injury,
                      color: Colors.deepPurple,
                    ),
                  ],
                ),
                title: Text(
                  "Pasien Lama",
                  style: TextStyle(fontSize: 18, color: Colors.deepPurple),
                ),
                subtitle: Text(
                  "Pasien sudah memiliki rekam medis",
                  style: TextStyle(color: Colors.black38),
                ),
              ),
              style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 1, color: Colors.deepPurple),
                  shape: StadiumBorder()),
            ),
          ],
        ),
      ),
    );
  }
}
