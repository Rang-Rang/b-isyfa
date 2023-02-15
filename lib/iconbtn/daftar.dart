import 'package:flutter/material.dart';
import 'package:smart_medic/iconbtn/daftar_penyakit.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:smart_medic/iconbtn/edit_penyakit.dart';
import 'package:smart_medic/pages/my_home.dart';
import 'package:smart_medic/services/base_url.dart';

class Daftar extends StatefulWidget {
  static const routeName = '/Daftar';

  @override
  State<Daftar> createState() => _DaftarState();
}

class _DaftarState extends State<Daftar> {
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
      final url = Uri.parse(baseUrl.link + 'penyakit');
      var response = await http.get(url);
      return json.decode(response.body);
    }

    ;

    /*
      nama fungsi : hapusPenyakit
      deskripsi : untuk menghapus data dari api
      parameter : $id = nilai integer, untuk mengfilter data penyakit berdasarkan id
      return : hapus data penyakit
      dibuat oleh : Rangga
      tanggal dibuat : 8/2/2023
    */
    Future hapusPenyakit(String id) async {
      try {
        final url = Uri.parse('http://192.168.1.8/api/penyakitFlutter/delete.php');
        var response = await http.post(url, body: {
          'nama_penyakit': id,
        });
        if (response.statusCode == 200) {
          return true;
        }
        return false;
      } catch (e) {
        print(e);
      }
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
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      onLongPress: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content:
                                  Text("Yakin menghapus riwayat penyakit?"),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    hapusPenyakit(list[index]['nama_penyakit'].toString())
                                        .then((value) {
                                      if (value) {
                                        final snackBar = SnackBar(
                                          content:
                                              Text("Data berhasil di simpan"),
                                        );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      } else {
                                        final snackBar = SnackBar(
                                          content: Text("Data gagal di simpan"),
                                        );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      }
                                    });
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: ((context) => Daftar())),
                                        (route) => false);
                                  },
                                  child: Text("Hapus"),
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                EditPenyakit(listData: {
                                              "nama_penyakit": list[index]
                                                  ['nama_penyakit'],
                                              "keterangan": list[index]
                                                  ['keterangan'],
                                              "status": list[index]['status'],
                                              "waktu": list[index]['waktu'],
                                            }),
                                          ));
                                    },
                                    child: Text("Update")),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Batal"),
                                ),
                              ],
                            );
                          },
                        );
                      });
                })
            : Center(
                child: CircularProgressIndicator(),
              );
      }),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar"),
        leading: IconButton(onPressed: () {
            Navigator.of(context).pushNamed(MyHome.routeName);
          }, icon: Icon(Icons.arrow_back)), 
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 15),
            child: Text(
              "Rekap medis",
              style: TextStyle(color: Colors.black38),
            ),
          ),
          Divider(
            color: Colors.grey,
          ),
          Expanded(child: futureBuilderPenyakit)
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
