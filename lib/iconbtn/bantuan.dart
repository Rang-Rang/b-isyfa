import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:smart_medic/pages/login/login.dart';

class Bantuan extends StatelessWidget {
  static const routeName = '/bantuan';
  const Bantuan({super.key});

    void signUserOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bantuan"),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(right: 220, top: 15),
            child: Text(
              "Help & Feedback",
              style: TextStyle(color: Colors.black38),
            ),
          ),
          Divider(
            color: Colors.grey,
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: <Widget>[
                Container(
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: ListTile(
                      title: Text('Contact Support'),
                      leading: Icon(Icons.contact_support),
                      onTap: () {
                        
                      },
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: ListTile(
                      title: Text('Suggest a Feature'),
                      leading: Icon(Icons.settings_suggest),
                      onTap: () {
                        
                      },
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: ListTile(
                      title: Text('FAQs'),
                      leading: Icon(Icons.live_help_rounded),
                      onTap: () {
                        
                      },
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: ListTile(
                      title: Text('Logout', style: TextStyle(color: Colors.red),),
                      leading: Icon(Icons.logout, color: Colors.red,),
                      onTap: () async {
                        signUserOut();
                        Navigator.of(context).pushNamed(LoginPage.routeName);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
