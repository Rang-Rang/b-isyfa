import 'package:flutter/material.dart';

class Sholat extends StatelessWidget {
  static const routeName = '/Sholat';
  const Sholat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sholat"),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(right: 220, top: 15),
            child: Text(
              "Jadwal Sholat",
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
                      title: Text('Isya'),
                      subtitle: Text('19:54'),
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
                      title: Text('Magrib'),
                      subtitle: Text('18:42'),
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
                      title: Text('Ashar'),
                      subtitle: Text('15:54'),
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
                      title: Text('Zuhur'),
                      subtitle: Text('12:35'),
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
                      title: Text('Subuh'),
                      subtitle: Text('05:10'),
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
                      title: Text('Imsyak'),
                      subtitle: Text('05:00'),
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
