import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smart_medic/pages/login/login.dart';
import 'package:smart_medic/pages/my_home.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:intl/intl.dart';
import 'package:smart_medic/pages/pasien/old_pasien.dart';
import 'package:smart_medic/services/auth_service.dart';

class Pasien extends StatefulWidget {
  static const routeName = '/login';

  @override
  State<Pasien> createState() => _PasienState();
}

class _PasienState extends State<Pasien> {
  TextEditingController dateController = TextEditingController();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
  }

  @override
  void initState() {
    dateController.text = ""; //set the initial value of text field
    super.initState();
  }

  String dropdownvalue = 'Cash';

  // List of items in our dropdown menu
  var items = [
    'Cash',
    'Kredit',
    'BCA',
    'BNI',
    'Bankrut',
  ];

  List<Tab> myTab = [
    Tab(
      child: Container(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              child: Text(
                "1",
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              backgroundColor: Colors.grey,
              radius: 10,
            ),
            Container(
              width: 7,
            ),
            Text("Identitas")
          ],
        ),
      ),
    ),
    Tab(
      child: Container(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              child: Text(
                "2",
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              backgroundColor: Colors.grey,
              radius: 10,
            ),
            Container(
              width: 7,
            ),
            Text("Tujuan")
          ],
        ),
      ),
    ),
    Tab(
      child: Container(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              child: Text(
                "3",
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              backgroundColor: Colors.grey,
              radius: 10,
            ),
            Container(
              width: 7,
            ),
            Text("Daftar")
          ],
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        
        length: 3,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Colors.white,
            // bottomOpacity: 0.0,
            elevation: 0.0,
            centerTitle: true,
            title: Text(
              "Pasien baru",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            bottom: TabBar(
              tabs: myTab,
              labelColor: Colors.green,
              unselectedLabelColor: Colors.grey,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white30,
              ),
              isScrollable: true,
              labelPadding: EdgeInsets.only(
                left: 25,
                right: 25,
              ),
            ),
          ),
          body: TabBarView(
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 60),
                    child: Image.asset("assets/icon.png"),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 40, right: 40, top: 20),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 272),
                          child: Text("Email"),
                        ),
                        TextField(
                          controller: emailController,
                          maxLines: 1,
                          decoration: InputDecoration(
                            // border: OutlineInputBorder(),
                            isDense: true, // Added this
                            contentPadding: EdgeInsets.all(8), // Added this
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 40, right: 40, top: 12),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 249),
                          child: Text("Password"),
                        ),
                        TextField(
                          controller: passwordController,
                          maxLines: 1,
                          obscureText: true,
                          decoration: InputDecoration(
                            // border: OutlineInputBorder(),
                            isDense: true, // Added this
                            contentPadding: EdgeInsets.all(8), // Added this
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 100),
                    child: OutlinedButton(
                      onPressed: () {
                        signUserIn();
                      },
                      child: Text(
                        "Kirim",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.only(left: 162, right: 162),
                        backgroundColor: Colors.deepPurple,
                        shape: StadiumBorder(),
                      ),
                    ),
                  ),
                  Container(
                    // padding: EdgeInsets.only(),
                    child: OutlinedButton(
                      onPressed: () {
                         Navigator.of(context).pushNamed(Logins.routeName);
                      },
                      child: Text(
                        "Pasien Lama",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.only(left: 140, right: 140),
                        backgroundColor: Colors.deepPurple,
                        shape: StadiumBorder(),
                      ),
                    ),
                  ),
                  Container(
                    // padding: EdgeInsets.only(),
                    child: OutlinedButton(
                      onPressed: () {
                        //  Navigator.of(context).pushNamed(Logins.routeName);
                        AuthService().signInWithGoogle();
                      },
                      child: Text(
                        "Login Dengan Google",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.only(left: 115, right: 115),
                        backgroundColor: Colors.deepPurple,
                        shape: StadiumBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 180, bottom: 20),
                    child: Text(
                      "Masukan tujuan pasien",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 240, bottom: 5),
                    child: Text(
                      "Nik Pasien",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 45, right: 45, bottom: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Masukkan NIK',
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 215, bottom: 5),
                    child: Text(
                      "Kontak Pasien",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 45, right: 45, bottom: 5),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Masukkan Kontak',
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 45, right: 45, bottom: 5),
                    child: DropdownSearch<String>(
                      popupProps: PopupProps.menu(
                        showSelectedItems: true,
                      ),
                      items: ["Cash", "Kredit", "Bank", 'Utang'],
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          labelText: "Metode Pembayaran",
                          labelStyle:
                              TextStyle(color: Colors.grey, fontSize: 18),
                          hintText: "Metode pembayaran",
                        ),
                      ),
                      onChanged: print,
                      selectedItem: "Cash",
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 45, right: 45, bottom: 5),
                    child: DropdownSearch<String>(
                      popupProps: PopupProps.menu(
                        showSelectedItems: true,
                      ),
                      items: ["Berobat", "Konsultasi", "Operasi"],
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          labelText: "Poliklinik Tujuan",
                          labelStyle:
                              TextStyle(color: Colors.grey, fontSize: 18),
                          hintText: "Poliklinik Tujuan",
                        ),
                      ),
                      onChanged: print,
                      selectedItem: "Berobat",
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 45, right: 45, bottom: 5),
                    child: DropdownSearch<String>(
                      popupProps: PopupProps.menu(
                        showSelectedItems: true,
                      ),
                      items: [
                        "Gedung 1"
                            "Gedung 2"
                            "Gedung 3"
                            "Gedung 4"
                            "Gedung 5"
                            "Gedung 6"
                            "Gedung 7"
                            "Gedung 8"
                            "Gedung 9"
                            "Gedung 10"
                      ],
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          labelText: "Gedung Antrian",
                          labelStyle:
                              TextStyle(color: Colors.grey, fontSize: 18),
                          hintText: "Gedung Antrian",
                        ),
                      ),
                      onChanged: print,
                      selectedItem: "Gedung 7",
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 45, right: 45, bottom: 5),
                    child: TextField(
                      controller:
                          dateController, //editing controller of this TextField
                      decoration: const InputDecoration(
                          icon: Icon(Icons.calendar_today), //icon of text field
                          labelText: "Enter Date" //label text of field
                          ),
                      readOnly: true, // when true user cannot edit text
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(), //get today's date
                            firstDate: DateTime(
                                2000), //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2060));

                        if (pickedDate != null) {
                          print(
                              pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
                          String formattedDate = DateFormat('yyyy-MM-dd').format(
                              pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                          print(
                              formattedDate); //formatted date output using intl package =>  2022-07-04
                          //You can format date as per your need

                          setState(() {
                            dateController.text =
                                formattedDate; //set foratted date to TextField value.
                          });
                        } else {
                          print("Date is not selected");
                        }
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, top: 90),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.deepPurple,
                                width: 1,
                              ),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.deepPurple,
                              size: 30,
                            ),
                            // color: Colors.white,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 0),
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Lanjut",
                              style: TextStyle(color: Colors.white),
                            ),
                            style: TextButton.styleFrom(
                                padding: EdgeInsets.only(left: 140, right: 140),
                                backgroundColor: Colors.deepPurple,
                                shape: StadiumBorder()),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                decoration: BoxDecoration(),
                padding: EdgeInsets.only(left: 40, right: 40, top: 2),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        color: Color.fromARGB(255, 201, 238, 255),
                      ),
                      child: Container(
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Text(
                              "!",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            backgroundColor: Colors.blue.shade900,
                            radius: 10,
                          ),
                          subtitle: Text(
                            "Bagi pasien yang sudah mengambil antrian\nnamun tidak datang di loket sampai 10\nnomor antrian selanjutnya, maka pasien\nharus mengambil antrian",
                            style: TextStyle(fontSize: 11),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(right: 240, top: 10),
                            child: Text(
                              "Nama Pasien",
                              style: TextStyle(
                                  color: Colors.black38, fontSize: 12),
                            ),
                          ),
                          TextField(
                            maxLines: 1,
                            decoration: InputDecoration(
                              // border: OutlineInputBorder(),
                              isDense: true, // Added this
                              contentPadding: EdgeInsets.all(8), // Added this
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(right: 252, top: 3),
                            child: Text(
                              "NIK Pasien",
                              style: TextStyle(
                                  color: Colors.black38, fontSize: 12),
                            ),
                          ),
                          TextField(
                            maxLines: 1,
                            decoration: InputDecoration(
                              // border: OutlineInputBorder(),
                              isDense: true, // Added this
                              contentPadding: EdgeInsets.all(8), // Added this
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(right: 192, top: 3),
                            child: Text(
                              "Tempat / Tanggal lahir",
                              style: TextStyle(
                                  color: Colors.black38, fontSize: 12),
                            ),
                          ),
                          TextField(
                            maxLines: 1,
                            decoration: InputDecoration(
                              // border: OutlineInputBorder(),
                              isDense: true, // Added this
                              contentPadding: EdgeInsets.all(8), // Added this
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(right: 235, top: 3),
                            child: Text(
                              "Kontak Pasien",
                              style: TextStyle(
                                  color: Colors.black38, fontSize: 12),
                            ),
                          ),
                          TextField(
                            maxLines: 1,
                            decoration: InputDecoration(
                              // border: OutlineInputBorder(),
                              isDense: true, // Added this
                              contentPadding: EdgeInsets.all(8), // Added this
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(right: 200, top: 3),
                            child: Text(
                              "Metode Pembayaran",
                              style: TextStyle(
                                  color: Colors.black38, fontSize: 12),
                            ),
                          ),
                          TextField(
                            maxLines: 1,
                            decoration: InputDecoration(
                              // border: OutlineInputBorder(),
                              isDense: true, // Added this
                              contentPadding: EdgeInsets.all(8), // Added this
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(right: 274, top: 3),
                            child: Text(
                              "Dokter",
                              style: TextStyle(
                                  color: Colors.black38, fontSize: 12),
                            ),
                          ),
                          TextField(
                            maxLines: 1,
                            decoration: InputDecoration(
                              // border: OutlineInputBorder(),
                              isDense: true, // Added this
                              contentPadding: EdgeInsets.all(8), // Added this
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(right: 225, top: 3),
                            child: Text(
                              "Poliklinik Tujuan",                              
                              style: TextStyle(
                                  color: Colors.black38, fontSize: 12),
                            ),
                          ),
                          TextField(
                            maxLines: 1,
                            decoration: InputDecoration(
                              // border: OutlineInputBorder(),
                              isDense: true, // Added this
                              contentPadding: EdgeInsets.all(8), // Added this
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 120),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 0),
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "Batal",
                                style: TextStyle(color: Colors.deepPurple),
                              ),
                              style: OutlinedButton.styleFrom(
                                  padding: EdgeInsets.only(left: 55, right: 55),
                                  side: BorderSide(
                                      width: 1, color: Colors.deepPurple),
                                  shape: StadiumBorder()),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 0),
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacementNamed(MyHome.routeName);
                              },
                              child: Text(
                                "Kirim",
                                style: TextStyle(color: Colors.white),
                              ),
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.only(left: 55, right: 55),
                                backgroundColor: Colors.deepPurple,
                                shape: StadiumBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )   
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      routes: {
        LoginPage.routeName: (context) => LoginPage(),
        MyHome.routeName: (context) => MyHome(),
        Pasien.routeName: (context) => Pasien(),
      },
    );
  }
}
