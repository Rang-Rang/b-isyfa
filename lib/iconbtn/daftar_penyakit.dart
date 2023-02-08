import 'package:flutter/material.dart';

class DaftarPenyakit extends StatefulWidget {
  static const routeName = '/daftarpenyakit';

  @override
  State<DaftarPenyakit> createState() => _DaftarPenyakitState();
}

class _DaftarPenyakitState extends State<DaftarPenyakit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Daftar Penyakit"),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                "Penyakit",
                style: TextStyle(color: Colors.black38),
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Penyakit',
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20,top: 20),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Keterangan',
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20,top: 20),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Status',
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20,top: 20),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Waktu',
                      ),
                    ),
                  ),
                ],
              ),
            ),
                  Container(
              // padding: EdgeInsets.only(top),
              child: OutlinedButton(
                onPressed: () {
                },
                child: Text(
                  "Ajukan",
                  style: TextStyle(color: Colors.white),
                ),
                style: TextButton.styleFrom(
                  padding: EdgeInsets.only(left: 140, right: 140),
                  backgroundColor: Colors.deepPurple,
                  shape: StadiumBorder(),
                ),
              ),
            ),
          ],
        ));
  }
}
