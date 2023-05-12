import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'anasayfa.dart';
import 'evcilHayvanEkle.dart';
import 'kisiselBilgi.dart';

class ucuncu extends StatefulWidget {
  const ucuncu({super.key});

  @override
  State<ucuncu> createState() => _ucuncuState();
}

class _ucuncuState extends State<ucuncu> {
  @override
  Widget build(BuildContext context) {
    return     Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/arkaplan2.jpg"), fit: BoxFit.cover),
        ),
        child: Column(
          children: [
           
            ListTile(
              leading: Icon(
                Icons.pets,
                color: Colors.blue.shade100,
              ),
              title: Text(profilim[0]),
              trailing: Icon(Icons.chevron_right_outlined),
              onTap: () {
                Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => evcilHayvanEkle()),
                              );
              },
            ),
            Padding(padding: EdgeInsets.only(top: 5)),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.blue.shade100,
              ),
              title: Text(profilim[1]),
              trailing: Icon(Icons.chevron_right_outlined),
              onTap: () {
                 Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => kisiselBilgi()),
                              );
              },
            ),
          ],
        ),
      ),
    );
  }
}