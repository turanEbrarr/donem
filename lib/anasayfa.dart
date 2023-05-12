// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/evcilHayvanEkle.dart';

import 'package:flutter_application_1/kisiselBilgi.dart';

import 'constans.dart';
import 'model.dart';


List<String> profilim = ["Evcil Hayvan Bilgileri", "Kişisel Bilgilerim"];
late BuildContext con;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Satış Fatura Kayıt';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: anasayfa(),
    );
  }
}

class anasayfa extends StatefulWidget {
  const anasayfa({super.key});

  @override
  State<anasayfa> createState() => _anasayfaState();
}

class _anasayfaState extends State<anasayfa> {
  TextEditingController c = new TextEditingController();
  TextEditingController c1 = new TextEditingController();
  late List<Model> bulunanKullanicilar = [];

  static void filtre(String aranan) {
    if (aranan.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = bosListe;
    } else {
      results = geciciIlan
          .where(
              (user) => user.cins!.toLowerCase().contains(aranan.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    geciciVeriEkle();
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  // ignore: prefer_final_fields
  static List<Widget> _widgetOptions = <Widget>[
    ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: geciciIlan.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 40)),
              ListTile(
                title: Text(geciciIlan[index].sahipAdi!),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/noPerson1.jpg'),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              Image(
                image: AssetImage(geciciIlan[index].resim!),
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * .5,
                width: MediaQuery.of(context).size.width,
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.comment)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.send)),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Text(
                    "Evcil Hayvan Sahibi Açıklaması: " +
                        geciciIlan[index].aciklama!,
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Divider(
                color: Colors.black,
                thickness: 1,
              )
            ],
          );
        }),
    Scaffold(
      body: SingleChildScrollView(
        //kjhgjjhhjkjk
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 100)),
            SizedBox(
              height: 50,
              child: TextField(
                onChanged: (value) {
                  filtre(value);
                },
                cursorHeight: 25,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    hintText: 'Ara...'),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 150)),
            sira()
          ],
        ),
      ),
    ),
    Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/arkaplan2.jpg"), fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 100)),
            ListTile(
              leading: Icon(
                Icons.pets,
                color: Colors.blue.shade100,
              ),
              title: Text(profilim[0]),
              trailing: Icon(Icons.chevron_right_outlined),
              onTap: () {
                Navigator.push(
                  con,
                  MaterialPageRoute(builder: (context) => evcilHayvanEkle()),
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
                  con,
                  MaterialPageRoute(builder: (context) => kisiselBilgi()),
                );
              },
            ),
          ],
        ),
      ),
    )
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    con = context;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      body: GestureDetector(
        onTap: () {
          setState(() {
            bulunanKullanicilar = results;
          });
        },
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.pets),
            label: 'Anasayfa',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Keşfet',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profilim',
            backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue.shade100,
        onTap: _onItemTapped,
      ),
    );
  }

  void geciciVeriEkle() {
    geciciIlan.add(Model(
        aciklama: "acıklama",
        ayBilgisi: 12,
        cins: "British",
        cinsiyet: "Dişi",
        hayvanIsmi: "Mira",
        lat: 10.0,
        long: 10.0,
        tur: "Kedi",
        uremeBilgisi: "Evet",
        resim: 'assets/k1.jpeg',
        sahipAdi: "Melike Nur  Çakmak"));

    geciciIlan.add(Model(
      aciklama: "acıklama",
      ayBilgisi: 12,
      cins: "Muhabbet Kuşu",
      cinsiyet: "Erkek",
      hayvanIsmi: "Boncuk",
      lat: 10.0,
      long: 10.0,
      tur: "Kuş",
      uremeBilgisi: "Evet",
      resim: 'assets/ku3.jpeg',
      sahipAdi: "Turan Küçükşahin",
    ));

    geciciIlan.add(Model(
      aciklama: "acıklama",
      ayBilgisi: 12,
      cins: "Hint Bülbülü",
      cinsiyet: "Erkek",
      hayvanIsmi: "Ramiz",
      lat: 10.0,
      long: 10.0,
      tur: "Kuş",
      uremeBilgisi: "Hayır",
      resim: 'assets/ku2.jpeg',
      sahipAdi: "Mehmet Zahit",
    ));

    geciciIlan.add(Model(
      aciklama: "acıklama",
      ayBilgisi: 12,
      cins: "Golden",
      cinsiyet: "Dişi",
      hayvanIsmi: "Leydi",
      lat: 10.0,
      long: 10.0,
      tur: "Kopek",
      uremeBilgisi: "Hayır",
      resim: 'assets/ko1.jpeg',
      sahipAdi: "Hakkı Saygılı",
    ));

    geciciIlan.add(Model(
      aciklama: "acıklama",
      ayBilgisi: 12,
      cins: "Doberman",
      cinsiyet: "Dişi",
      hayvanIsmi: "Sultan",
      lat: 10.0,
      long: 10.0,
      tur: "Kopek",
      uremeBilgisi: "Evet",
      resim: 'assets/ko3.jpeg',
      sahipAdi: "Aylin Çakmak",
    ));

    geciciIlan.add(Model(
      aciklama: "acıklama",
      ayBilgisi: 12,
      cins: "Tekir",
      cinsiyet: "Erkek",
      hayvanIsmi: "Azman",
      lat: 10.0,
      long: 10.0,
      tur: "Kedi",
      uremeBilgisi: "Evet",
      resim: 'assets/k3.jpeg',
      sahipAdi: "Rahime Küçükşahin",
    ));

    geciciIlan.add(Model(
      aciklama: "acıklama",
      ayBilgisi: 12,
      cins: "Golden",
      cinsiyet: "Dişi",
      hayvanIsmi: "Mira",
      lat: 10.0,
      long: 10.0,
      tur: "Köpek",
      uremeBilgisi: "Evet",
      resim: 'assets/ko4.jpeg',
      sahipAdi: "Mehmet Çakmak",
    ));

    geciciIlan.add(Model(
      aciklama: "acıklama",
      ayBilgisi: 12,
      cins: "Papağan",
      cinsiyet: "Dişi",
      hayvanIsmi: "Cici",
      lat: 10.0,
      long: 10.0,
      tur: "Kuş",
      uremeBilgisi: "Evet",
      resim: 'assets/ku1.jpeg',
      sahipAdi: "Aliye Şahin",
    ));

    geciciIlan.add(Model(
      aciklama: "acıklama",
      ayBilgisi: 12,
      cins: "Sivas Kangalı",
      cinsiyet: "Erkek",
      hayvanIsmi: "Aslan",
      lat: 10.0,
      long: 10.0,
      tur: "Kopek",
      uremeBilgisi: "Evet",
      resim: 'assets/ko2.jpeg',
      sahipAdi: "Merve Çakmak",
    ));

    geciciIlan.add(Model(
      aciklama: "acıklama",
      ayBilgisi: 12,
      cins: "Çin Aslanı",
      cinsiyet: "Dişi",
      hayvanIsmi: "Karabaş",
      lat: 10.0,
      long: 10.0,
      tur: "Köpek",
      uremeBilgisi: "Evet",
      resim: 'assets/ko4.jpeg',
      sahipAdi: "Aliye Şahin",
    ));
  }
}

class sira extends StatelessWidget {
  const sira({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          tavsiyeCard(
            image: "assets/info.jpg",
          ),
          tavsiyeCard(
            image: "assets/info1.jpg",
          ),
          tavsiyeCard(
            image: "assets/info2.jpg",
          ),
          tavsiyeCard(
            image: "assets/info3.jpg",
          )
        ],
      ),
    );
  }
}

class tavsiyeCard extends StatelessWidget {
  const tavsiyeCard({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: kDefaultPadding,
      ),
      width: size.width,
      child: Column(
        children: [
          Image.asset(image),
          GestureDetector(
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: kPrimaryColor.withOpacity(0.23),
                    )
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
