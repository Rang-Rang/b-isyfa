import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:smart_medic/iconbtn/ambulan.dart';
import 'package:smart_medic/iconbtn/bantuan.dart';
import 'package:smart_medic/iconbtn/daftar.dart';
import 'package:smart_medic/iconbtn/hasil_lab.dart';
import 'package:smart_medic/iconbtn/kamar.dart';
import 'package:smart_medic/iconbtn/sholat.dart';
import 'package:smart_medic/main.dart';
import 'package:smart_medic/pages/jadwalmu.dart';
import 'package:smart_medic/pages/login/login.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:smart_medic/pages/pengaturan.dart';
import 'package:smart_medic/pages/profile.dart';

class MyHome extends StatefulWidget {
  // nama route
  static const routeName = '/home';

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

  // fungsi logout
  void signUserOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
  }


  // index awal dari tabs bottom bar
  int _currentIndex = 0;


  // user login profile
  final user = FirebaseAuth.instance.currentUser;
  
  
  // fungsi penghubung api kamar
  Future getNews() async {
    final url = Uri.parse('http://192.168.1.12/rest_bisyifa/api/news');
    var response = await http.get(url);
    return json.decode(response.body);
  }


  // fungsi penghubung api kamar
  Future getKamar() async {
    final url = Uri.parse('http://192.168.1.12/rest_bisyifa/api/kamar/');
    var response = await http.get(url);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {

    // penghubung api dengan news
    var futureBuilderNews = FutureBuilder(
      future: getNews(),
      builder: ((context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);
        return snapshot.hasData
            ? ListView.builder(
                padding: const EdgeInsets.only(top: 30),
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  List list = snapshot.data;
                  return SingleChildScrollView(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30, top: 10, bottom: 40),
                          child: Container(
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 10, top: 16),
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(list[index]['id_kategori'],
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white,
                                                ),
                                                maxLines: 1,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                            Text(list[index]['title'],
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                maxLines: 1,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                            Container(
                                              height: 5,
                                            ),
                                            Text(list[index]['content'],
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white60,
                                                ),
                                                maxLines: 1,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  height: 120,
                                  width: 330,
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurple,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                })
            : Center(
                child: CircularProgressIndicator(),
              );
      }),
    );

    // penghubung api dan tampilan kamar
    var FutureBuilder2 = FutureBuilder(
      future: getKamar(),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);
        List list = snapshot.data;
        return snapshot.hasData
            ? ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  List list = snapshot.data;
                  return Container(
                    padding: EdgeInsets.zero,
                    child: Container(
                      // padding: EdgeInsets.only(bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      list[index]['total_kamar'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    Text("Total kamar"),
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 16, right: 16),
                                  child: Text(
                                    "|",
                                    style: TextStyle(color: Colors.black38),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      list[index]['kamar_tersedia'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    Text("Tersedia"),
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 16, right: 16),
                                  child: Text(
                                    "|",
                                    style: TextStyle(color: Colors.black38),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      list[index]['kamar_terpakai'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    Text("Terpakai"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      height: 0,
                    ),
                    height: 100,
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );

    // seluruh tampilan home 
    var home = Column(
      children: [
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.deepPurple.shade500,
                    Colors.deepPurple.shade900
                  ],
                ),
              ),
              padding: EdgeInsets.only(top: 70),
              child: ListTile(
                leading: GestureDetector(
                  onTap: (() async {
                    signUserOut();
                    Navigator.of(context).pushNamed(LoginPage.routeName);
                    //  Navigator.of(context).pop();
                  }),
                  child: CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                ),
                title: Text(
                  "${user?.email}",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "No. RM: 64484",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: CircleAvatar(
                  child: Icon(Icons.search),
                  backgroundColor: Colors.black12,
                ),
              ),
              width: double.infinity,
              height: 180,
            ),
          ],
        ),
        Expanded(child: FutureBuilder2),
        Padding(
          padding: const EdgeInsets.only(left: 50, right: 50, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(Daftar.routeName);
                    },
                    child: Container(
                      child: Column(
                        children: [
                          CircleAvatar(
                              child: Icon(
                                Icons.library_books,
                                color: Colors.deepPurple,
                                size: 21,
                              ),
                              backgroundColor: Colors.black12,
                              radius: 20),
                          Text(
                            "Daftar",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(Sholat.routeName);
                    },
                    child: Container(
                      child: Column(
                        children: [
                          CircleAvatar(
                              child: Icon(
                                Icons.mosque,
                                color: Colors.deepPurple,
                                size: 21,
                              ),
                              backgroundColor: Colors.black12,
                              radius: 20),
                          Text(
                            "Sholat",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(Kamar.routeName);
                    },
                    child: Container(
                      child: Column(
                        children: [
                          CircleAvatar(
                              child: Icon(
                                Icons.medication,
                                color: Colors.deepPurple,
                                size: 21,
                              ),
                              backgroundColor: Colors.black12,
                              radius: 20),
                          Text(
                            "Kamar",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(Ambulan.routeName);
                    },
                    child: Container(
                      child: Column(
                        children: [
                          CircleAvatar(
                              child: Icon(
                                Icons.medical_services,
                                color: Colors.deepPurple,
                                size: 21,
                              ),
                              backgroundColor: Colors.black12,
                              radius: 20),
                          Text(
                            "Ambulan",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(HasilLab.routeName);
                    },
                    child: Container(
                      child: Column(
                        children: [
                          CircleAvatar(
                              child: Icon(
                                Icons.science,
                                color: Colors.deepPurple,
                                size: 21,
                              ),
                              backgroundColor: Colors.black12,
                              radius: 20),
                          Text(
                            "Hasil Lab",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(Bantuan.routeName);
                    },
                    child: Container(
                      child: Column(
                        children: [
                          CircleAvatar(
                              child: Icon(
                                Icons.help,
                                color: Colors.deepPurple,
                                size: 21,
                              ),
                              backgroundColor: Colors.black12,
                              radius: 20),
                          Text(
                            "Bantuan",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 30,
          ),
          child: Row(
            children: [
              Text(
                "Informasi lainnya",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Expanded(child: futureBuilderNews),
        Container(
          padding: EdgeInsets.only(left: 30, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Layanan Dokter",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextButton(
                child: Text("Lihat Semua",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onPressed: () {},
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 7),
                child: Container(
                  child: Row(
                    children: [
                      Container(
                        // padding: EdgeInsets.only(left: 10, top: 4),
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Row(
                            children: [
                              Container(
                                width: 65,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                              ),
                              Container(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "dr. Juliansyah Safitri Safri, SP.THT",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Specialis THT",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black45,
                                    ),
                                  ),
                                  Container(
                                    height: 20,
                                  ),
                                  Text(
                                    "Available",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.green,
                                        fontWeight: FontWeight.w700),
                                    maxLines: 2,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        height: 70,
                        width: 290,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 7),
                child: Container(
                  child: Row(
                    children: [
                      Container(
                        // padding: EdgeInsets.only(left: 10, top: 4),
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Row(
                            children: [
                              Container(
                                width: 65,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                              ),
                              Container(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "dr. Juliansyah Safitri Safri, SP.THT",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Specialis THT",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black45,
                                    ),
                                  ),
                                  Container(
                                    height: 20,
                                  ),
                                  Text(
                                    "Unavailable",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.red,
                                        fontWeight: FontWeight.w700),
                                    maxLines: 2,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        height: 70,
                        width: 290,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );

    // tabs yang ada dari bottom navigation bar
    final tabs = [
      home,
      Jadwalmu(),
      Center(child: Text("Notifikasi"),),
      Pengaturan(),
      Profile(),
    ];
    return Scaffold(
      resizeToAvoidBottomInset: false,

      appBar: null,

      // body dari seluruh aplikasi
      body: tabs[_currentIndex],

      // bottom navigation bar untuk bar bagian bawah
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.offline_pin_outlined),
            label: "Jadwalmu",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none_outlined),
            label: "Notifikasi",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Pengaturan",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin),
            label: "Profile",
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
