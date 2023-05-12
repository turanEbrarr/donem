import 'package:flutter/material.dart';
import 'package:flutter_application_1/ikinci.dart';
import 'package:flutter_application_1/ilk.dart';
import 'package:flutter_application_1/ucuncu.dart';


class anasayfa2 extends StatefulWidget {
  const anasayfa2({super.key});
  

  

  @override
  State<anasayfa2> createState() => _anasayfa2State();
}

class _anasayfa2State extends State<anasayfa2> {
  @override
  Widget build(BuildContext context) {
   return DefaultTabController(
      length: 3,
      child: Scaffold(
       
       extendBodyBehindAppBar: true,
        body: Column(
          children: const <Widget>[
            Padding(padding: EdgeInsets.only(top: 40)),
            Material(
              color: Colors.white,
              child: TabBar(
                labelColor: Colors.amber,
                indicatorColor: Colors.amber,
                unselectedLabelColor: Colors.grey,
                
                tabs: [
                  Tab(
                    text: ("Anasayfa"),
                    icon: Icon(
                      Icons.pets,
                      color: Colors.amber,
                    ),
                  ),
                  Tab(
                    text: ("Keşfet"),
                    icon: Icon(
                      Icons.search,
                      color:Colors.amber,
                    ),
                  ),
                  Tab(
                    text: ("Profilim"),
                    icon: Icon(
                      Icons.person,
                      color: Colors.amber,
                    ),
                  ),
                
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ilk(),
                  ikinci(),
                  ucuncu(),
                  
        
                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}