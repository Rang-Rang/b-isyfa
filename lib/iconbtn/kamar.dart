import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:smart_medic/services/base_url.dart';

class Kamar extends StatelessWidget {
  static const routeName = '/Kamar';

  Future getKamar() async {
    final url = Uri.parse(baseUrl.linkApi+'kamar');
    var response = await http.get(url);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kamar Rumah sakit"),
      ),

      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getKamar(),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                return snapshot.hasData
                    ? ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          List list = snapshot.data;
                          return Column(
                            children: [
                              ListTile(
                                title: Text("Kamar Tersedia: " +
                                    list[index]['total_kamar']),
                              ),
                              Divider(
                                color: Colors.grey,
                              ),
                            ],
                          );
                        },
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      );
              },
            ),
          ),
          ListTile(
            leading: Container(
              width: 65,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
            ),
            title: Text(
              'Kamar 1',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'Tersedia',
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Text("06:27"),
            onTap: () {},
          ),
          ListTile(
            leading: Container(
              width: 65,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
            ),
            title: Text(
              'Kamar 2',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'Tidak tersedia',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Text("09:27"),
            onTap: () {},
          ),
          ListTile(
            leading: Container(
              width: 65,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
            ),
            title: Text(
              'Kamar 3',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'Sedang dibersihkan',
              style: TextStyle(
                color: Colors.purple,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Text("20:30"),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
