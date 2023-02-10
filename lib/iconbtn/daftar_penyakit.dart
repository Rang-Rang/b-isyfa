import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Future<penyakit> createPenyakit(String namaPenyakit, String Keterangan, String Status, String Waktu) async {
//   final response = await http.post(
//     Uri.parse('http://192.168.1.12/rest_bisyifa/api/penyakit'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{
//       'nama_penyakit': namaPenyakit,
//       'keterangan': Keterangan,
//       'status': Status,
//       'Waktu': Waktu,
//     }),
//   );

//   if (response.statusCode == 201) {
//     // If the server did return a 201 CREATED response,
//     // then parse the JSON.
//     return penyakit.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 201 CREATED response,
//     // then throw an exception.
//     throw Exception('Failed to create penyakit.');
//   }
// }

// class penyakit {
//   final int idPenyakit;
//   final String namaPenyakit;
//   final String keterangan;
//   final String status;
//   final String waktu;

//   const penyakit({required this.idPenyakit, required this.namaPenyakit,required this.keterangan,required this.status, required this.waktu});

//   factory penyakit.fromJson(Map<String, dynamic> json) {
//     return penyakit(
//       idPenyakit: json['id_penyakit'],
//       namaPenyakit: json['nama_penyakit'],
//       keterangan: json['keterangan'],
//       status: json['status'],
//       waktu: json['waktu'],
//     );
//   }
// }

class DaftarPenyakit extends StatefulWidget {
  static const routeName = '/daftarpenyakit';

  @override
  State<DaftarPenyakit> createState() => _DaftarPenyakitState();
}

class _DaftarPenyakitState extends State<DaftarPenyakit> {
  final formKey = GlobalKey<FormState>();
  TextEditingController penyakitController = TextEditingController();
  TextEditingController keteranganController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController waktuController = TextEditingController();

  Future _simpan() async {
    final response = await http.post(
        Uri.parse('http://192.168.1.12/rest_bisyifa/api/penyakit'),
        body: {
          "nama_penyakit": penyakitController.text,
          "keterangan": keteranganController.text,
          "status": statusController.text,
          "waktu": waktuController.text,
        });
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  // Future<penyakit>? _futurePenyakit;

  Future getPenyakit() async {
    final url = Uri.parse('http://192.168.1.12/rest_bisyifa/api/penyakit');
    var response = await http.get(url);
    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();
  }

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
              child: Form(
                key: formKey,
                child: ListView(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        controller: penyakitController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Penyakit',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Penyakit tidak boleh kosong";
                          }
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: TextFormField(
                        controller: keteranganController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Keterangan',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Keterangan tidak boleh kosong";
                          }
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: TextFormField(
                        controller: statusController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Status',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Status tidak boleh kosong('Tunggu', 'Antrian', 'Periksa', 'Selesai')";
                          }
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: TextFormField(
                        controller: waktuController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Waktu',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Waktu tidak boleh kosong: Tahun-Bulan-Tanggal(2020-12-30)";
                          }
                        },
                      ),
                    ),

                    // Container(
                    //   padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                    //   child: TextFormField(
                    //     controller:
                    //         waktuController, //editing controller of this TextField
                    //     decoration: const InputDecoration(
                    //         icon: Icon(Icons.calendar_today), //icon of text field
                    //         labelText: "Enter Date" //label text of field
                    //         ),
                    //     readOnly: true, // when true user cannot edit text
                    //     onTap: () async {
                    //       DateTime? pickedDate = await showDatePicker(
                    //           context: context,
                    //           initialDate: DateTime.now(), //get today's date
                    //           firstDate: DateTime(
                    //               2000), //DateTime.now() - not to allow to choose before today.
                    //           lastDate: DateTime(2060));

                    //       if (pickedDate != null) {
                    //         print(
                    //             pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
                    //         String formattedDate = DateFormat('yyyy-MM-dd').format(
                    //             pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                    //         print(
                    //             formattedDate); //formatted date output using intl package =>  2022-07-04
                    //         //You can format date as per your need

                    //         setState(() {
                    //           waktuController.text =
                    //               formattedDate; //set foratted date to TextField value.
                    //         });
                    //       } else {
                    //         print("Date is not selected");
                    //       }
                    //     },
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            Container(
              // padding: EdgeInsets.only(top),
              child: ElevatedButton(
                onPressed: () {
                  // _futurePenyakit = createPenyakit(penyakitController.text,keteranganController.text,statusController.text,waktuController.text);
                  if (formKey.currentState!.validate()) {
                    _simpan().then((value) {
                      if (value) {
                        final snackBar = SnackBar(
                          content: Text("Data berhasil di simpan"),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else {
                        final snackBar = SnackBar(
                          content: Text("Data gagal di simpan"),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      };
                    });
                  }
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
