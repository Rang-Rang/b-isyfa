import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/cupertino.dart';

class Jadwalmu extends StatefulWidget {
  const Jadwalmu({super.key});

  @override
  State<Jadwalmu> createState() => _JadwalmuState();
}

class _JadwalmuState extends State<Jadwalmu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("Jadwalmu"),
        leading: Icon(Icons.offline_pin_outlined),
      ),
      body: ListView(
        children: [
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
                              color: Colors.green, fontWeight: FontWeight.bold),
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
                              color: Colors.amber, fontWeight: FontWeight.bold),
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
                              color: Colors.brown, fontWeight: FontWeight.bold),
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
                              color: Colors.red, fontWeight: FontWeight.bold),
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
    );
  }
}
