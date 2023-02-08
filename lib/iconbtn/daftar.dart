import 'package:flutter/material.dart';
import 'package:smart_medic/iconbtn/daftar_penyakit.dart';

class Daftar extends StatelessWidget {
  static const routeName = '/Daftar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar"),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 15),
            child: Text(
              "Riwayat Penyakit",
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
                  // height: 50,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            'Demam Berdarah',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text('Penyakit DBD'),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("02:30"),
                              Text(
                                "Selesai",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          title: Text(
                            'Asma',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text('Penyakit Pernapasan'),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("11:30"),
                              Text(
                                "Periksa",
                                style: TextStyle(
                                    color: Colors.amber,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          title: Text(
                            'Cacar',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text('Penyakit Kulit'),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("16:30"),
                              Text(
                                "Antrian",
                                style: TextStyle(
                                    color: Colors.brown,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          title: Text(
                            'Demam',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text('Penyakit Badan'),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("16:30"),
                              Text(
                                "Tunggu",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(DaftarPenyakit.routeName);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  // padding: EdgeInsets.all(20),
                  // color: Colors.green,
                  child: TextButton(
                onPressed: () {},
                child: Text(
                  "Riwayat Selesai",
                  style: TextStyle(
                      color: Colors.purple, fontWeight: FontWeight.bold),
                ),
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                // padding: EdgeInsets.all(20),
                // color: Colors.green,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Belum Selesai",
                    style: TextStyle(
                        color: Colors.purple, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
