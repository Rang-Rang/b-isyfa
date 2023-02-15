import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:smart_medic/services/base_url.dart';


class Jadwalmu extends StatefulWidget {
  const Jadwalmu({super.key});

  @override
  State<Jadwalmu> createState() => _JadwalmuState();
}

class _JadwalmuState extends State<Jadwalmu> {
  @override
  Widget build(BuildContext context) {

     /*
      nama fungsi : getPenyakit
      deskripsi : untuk mengambil data dari api
      parameter : -
      return : response.body
      dibuat oleh : Rangga
      tanggal dibuat : 8/2/2023
    */
    Future getPenyakit() async {
      final url = Uri.parse(baseUrl.link+'penyakit');
      var response = await http.get(url);
      return json.decode(response.body);
    }
    var futureBuilderPenyakit = FutureBuilder(
      future: getPenyakit(),
      builder: ((context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);
        return snapshot.hasData
            ? ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  List list = snapshot.data;
                  return ListTile(
                    title: Text(
                      list[index]['nama_penyakit'].toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(list[index]['keterangan'].toString()),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(list[index]['waktu'].toString()),
                        Text(
                          list[index]['status'].toString(),
                          style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    onTap: () {},
                  );
                })
            : Center(
                child: CircularProgressIndicator(),
              );
      }),
    );

    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("Jadwalmu"),
        leading: Icon(Icons.offline_pin_outlined),
      ),
      body: futureBuilderPenyakit,
    );
  }
}
