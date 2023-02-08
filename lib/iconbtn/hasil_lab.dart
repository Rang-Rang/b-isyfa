import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HasilLab extends StatelessWidget {
  static const routeName = '/lab';

  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hasil Lab"),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 15),
            child: Text(
              "${user?.email}",
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
                      title: Text('Kesehatan'),
                      subtitle: Text('96%'),
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
                      title: Text('Tensi Darah'),
                      subtitle: Text('90/60 mmHg'),
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
                      title: Text('Berat Badan'),
                      subtitle: Text('65'),
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
                      title: Text('Tinggi Badan'),
                      subtitle: Text('170'),
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
                      title: Text('Suhu Badan'),
                      subtitle: Text('36,1 Derajat'),
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
                      title: Text('Penyakit'),
                      subtitle: Text('-'),
                      onTap: () {
                        
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
