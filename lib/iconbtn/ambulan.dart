import 'package:flutter/material.dart';

class Ambulan extends StatelessWidget {
  static const routeName = '/ambulan';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ambulan Darurat"),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 15),
            child: Text(
              "Hubungi Jika terjadi kedaruratan",
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
                      title: Text('Dokter Terdekat'),
                      subtitle: Text('Mencari Dokter terdekat dari lokasi'),
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
                      title: Text('Ambulan Jenazah'),
                      subtitle: Text('Pengangkatan Jenazah'),
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
                      title: Text('Korban Kecelakaan'),
                      subtitle: Text('Untuk mengobati korban kecelakaan'),
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
                      title: Text('Covid'),
                      subtitle: Text('Virus Covid'),
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
                      title: Text('Penyakit Mematikan'),
                      subtitle: Text('Mengabari para medis'),
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
                      title: Text('Membeli Obat'),
                      subtitle: Text('Obat kesehatan'),
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