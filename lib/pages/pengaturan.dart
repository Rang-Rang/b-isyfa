import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Pengaturan extends StatefulWidget {
  const Pengaturan({super.key});

  @override
  State<Pengaturan> createState() => _PengaturanState();
}

class _PengaturanState extends State<Pengaturan> {
  bool SwitchValue = false;
  bool SwitchValue2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("Pengaturan"),
        leading: Icon(Icons.settings),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Matikan Notifikasi"),
            trailing: CupertinoSwitch(
              value: SwitchValue,
              onChanged: (bool? value) {
                setState(() {
                  SwitchValue = value ?? false;
                });
              },
            ),
          ),
          ListTile(
            title: Text("Dapatkan Penawaran"),
            trailing: CupertinoSwitch(
              value: SwitchValue2,
              onChanged: (bool? value) {
                setState(() {
                  SwitchValue2 = value ?? false;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
