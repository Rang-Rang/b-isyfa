import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:smart_medic/pages/login/login.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final user = FirebaseAuth.instance.currentUser;

  void signUserOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
  }

  getProfileImage() {
    if (user?.photoURL != null) {
      String? userImage = user?.photoURL;
      return Image.network("$userImage");
    } else {
      return CircleAvatar(
        radius: 50,
      );
    }
  }

  getProfileName() {
    if (user?.displayName != null) {
      return Text(
        "${user?.displayName}",
        style: TextStyle(fontSize: 28),
      );
    } else {
      return Text(
        "Pasien",
        style: TextStyle(fontSize: 28),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("Profile"),
        leading: Icon(Icons.person_pin),
      ),
      body: ListView(
        children: [
          Center(
            child: getProfileImage(),
          ),
          Center(
            child: getProfileName(),
          ),
          ListTile(
            title: Text(
              'Logout',
              style: TextStyle(color: Colors.red),
            ),
            leading: Icon(
              Icons.logout,
              color: Colors.red,
            ),
            onTap: () async {
              signUserOut();
              Navigator.of(context).pushNamed(LoginPage.routeName);
            },
          )
        ],
      ),
    );
  }
}
