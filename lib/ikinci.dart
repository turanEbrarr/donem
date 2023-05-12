import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'constans.dart';
import 'model.dart';

class ikinci extends StatefulWidget {
  const ikinci({super.key});

  @override
  State<ikinci> createState() => _ikinciState();
}

class _ikinciState extends State<ikinci> {
  List<Model> bosListe = [];
  List<Model> bulunanKayitlar = [];
  @override
  initState() {
 
    bulunanKayitlar = bosListe;
    print(geciciIlan.length);
    super.initState();
  }

  @override
  void dispose() {

    super.dispose();
    bulunanKayitlar.clear();
  }

  void arama(String girilenData) {
    List<Model> results = [];
    if (girilenData.isEmpty) {
    
      bulunanKayitlar.clear();
      results = bosListe;
    } else {
      results = geciciIlan
          .where((item) =>
              item.cins!.toLowerCase().contains(girilenData.toLowerCase()))
          .toList();
    }
 
    setState(() {
      bulunanKayitlar = results;
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          bulunanKayitlar.clear();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 10)),
              SizedBox(
                height: 50,
                child: TextField(
                  onChanged: (value) {
                    bulunanKayitlar.clear;
                    arama(value);
                  },
                  cursorHeight: 25,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Colors.greenAccent), 
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      hintText: 'Ara...'),
                ),
              ),
              bulunanKayitlar.isNotEmpty
                  ? ListView.separated(
                      separatorBuilder: (_, __) => const Divider(),
                      shrinkWrap: true,
                      itemCount: bulunanKayitlar.length,
                      itemBuilder: (context, index) => Card(
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                AssetImage(bulunanKayitlar[index].resim.toString()),
                          ),
                          title: Text(bulunanKayitlar[index].hayvanIsmi.toString()),
                          trailing: Text(
                              bulunanKayitlar[index].ayBilgisi.toString() +
                                  " Aylık"),
                          subtitle: Text("Cinsiyet : " +
                              bulunanKayitlar[index].cinsiyet.toString() +
                              "  " +
                              "Üreyebilir mi ? " +
                              bulunanKayitlar[index].uremeBilgisi.toString()),
                        ),
                      ),
                    )
                  : SizedBox(
                      height: 40,
                      child: const Text(
                        '...',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
              Padding(padding: EdgeInsets.only(top: 350)),
              sira()
            ],
          ),
        ),
      ),
    );
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
