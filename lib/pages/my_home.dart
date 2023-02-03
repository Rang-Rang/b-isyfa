import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_medic/main.dart';

class MyHome extends StatefulWidget {
  static const routeName = '/home';

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  void signUserOut(){
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      appBar: null,
      // drawer: Drawer(
      //   child: Column(
      //     children: [

      //     ],
      //   ),
      // ),
      body: Column(
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
                    onTap: (() {
                      signUserOut();
                    }),
                    child: CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                  ),
                  title: Text(
                    "Muhammad Al-Ghifari",
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
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, top: 160),
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            "58",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text("Total kamar")
                        ],
                      ),
                      Container(
                        child: Text(
                          "|",
                          style: TextStyle(color: Colors.black38),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "18",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text("Tersedia")
                        ],
                      ),
                      Container(
                        child: Text(
                          "|",
                          style: TextStyle(color: Colors.black38),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "40",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text("Terpakai")
                        ],
                      ),
                    ],
                  ),
                  width: 300,
                  height: 90,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 50, right: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    TextButton(
                      onPressed: () {},
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
                    Container(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: () {},
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
                      onPressed: () {},
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
                    Container(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: () {},
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
                      onPressed: () {},
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
                    Container(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: () {},
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
            padding: const EdgeInsets.only(left: 30, top: 20),
            child: Row(
              children: [
                Text(
                  "Informasi lainnya",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          // card
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
                          padding: EdgeInsets.only(left: 10, top: 16),
                          alignment: Alignment.centerLeft,
                          child: Container(
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Ikuti Program",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      "Vaksin gratis",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "di Isyfa",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Container(
                                      height: 5,
                                    ),
                                    Text(
                                      "Konsultasi lebih dalam dengan\ndokter konsulen terbaik",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white60,
                                      ),
                                      maxLines: 2,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          height: 120,
                          width: 290,
                          decoration: BoxDecoration(
                            color: Colors.deepPurple,
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
                          padding: EdgeInsets.only(left: 10, top: 16),
                          alignment: Alignment.centerLeft,
                          child: Container(
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Ikuti Program",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      "Vaksin gratis",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "di Isyfa",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Container(
                                      height: 5,
                                    ),
                                    Text(
                                      "Konsultasi lebih dalam dengan\ndokter konsulen terbaik",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white60,
                                      ),
                                      maxLines: 2,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          height: 120,
                          width: 290,
                          decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                        ),
                        Container(
                          width: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
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
      ),

      bottomNavigationBar: BottomNavigationBar(
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
      ),
    );
  }
}
