import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

class evcilHayvanEkle extends StatefulWidget {
  const evcilHayvanEkle({super.key});

  @override
  State<evcilHayvanEkle> createState() => _evcilHayvanEkleState();
}

class _evcilHayvanEkleState extends State<evcilHayvanEkle> {
  File? image;
  File? resim;

  Completer<GoogleMapController> haritakontrol = Completer();
  var ilkkonum =
      CameraPosition(target: LatLng(38.7412482, 26.1844276), zoom: 4);
  List<Marker> isaret = <Marker>[];

  bool durum2 = false;
  String? gender = "";
  var secilen = 'Kedi';
  var secilen1;
  List<String> turler = ['Kedi', 'Köpek', 'Kuş'];
  List<String> kediCinsleri = [
    'British Shorthair',
    'Van Kedisi',
    'Scottish Fold'
  ];
  List<String> kopekCinsleri = ['Maltipoo', 'Çin Aslanı', 'Yorkshire Terrier'];
  List<String> kusCinsleri = ['Muhabbet Kuşu', 'Kanarya', 'Cennet Papağanı'];
  List<String> secilenHayvan = ["sj", "momment"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        extendBodyBehindAppBar: true,
        body: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/arkaplan2.jpg"), fit: BoxFit.cover),
            ),
            child: SingleChildScrollView(
                child: Column(children: [
              Padding(padding: EdgeInsets.only(top: 80)),
              resim != null
                  ? GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                height: 200,
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Text(
                                      "Resim Seç",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    TextButton(
                                        onPressed: () async {
                                          final picker = await ImagePicker()
                                              .pickImage(
                                                  source: ImageSource.gallery);

                                          setState(() {
                                            resim = File(picker!.path);
                                          });
                                          Navigator.pop(context);
                                        },
                                        child: Text("Galeriden")),
                                    TextButton(
                                        onPressed: () async {
                                          final picker = await ImagePicker()
                                              .pickImage(
                                                  source: ImageSource.camera);

                                          setState(() {
                                            resim = File(picker!.path);
                                          });
                                          Navigator.pop(context);
                                        },
                                        child: Text("Kameradan"))
                                  ],
                                ),
                              );
                            });
                      },
                      child: CircleAvatar(
                        backgroundImage: FileImage(resim!),
                        radius: 100,
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                height: 200,
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Text(
                                      "Resim Seç",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    TextButton(
                                        onPressed: () async {
                                          final picker = await ImagePicker()
                                              .pickImage(
                                                  source: ImageSource.gallery);

                                          setState(() {
                                            resim = File(picker!.path);
                                          });
                                          Navigator.pop(context);
                                        },
                                        child: Text("Galeriden")),
                                    TextButton(
                                        onPressed: () async {
                                          final picker = await ImagePicker()
                                              .pickImage(
                                                  source: ImageSource.camera);

                                          setState(() {
                                            resim = File(picker!.path);
                                          });
                                          Navigator.pop(context);
                                        },
                                        child: Text("Kameradan"))
                                  ],
                                ),
                              );
                            });
                      },
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/resim.jpg"),
                        radius: 100,
                      ),
                    ),
              Padding(padding: EdgeInsets.only(top: 20)),
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Evcil Hayvanınızın İsmini Giriniz",
                      filled: true,
                      fillColor: Colors.blue.shade100,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      )),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "Evcil Hayvanınız Kaç Aylık",
                      filled: true,
                      fillColor: Colors.blue.shade100,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      )),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ListTile(
                              title: const Text('Dişi'),
                              leading: Radio(
                                value: "Disi",
                                groupValue: gender,
                                onChanged: (value) {
                                  setState(() {
                                    gender = value.toString();
                                  });
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListTile(
                              title: const Text('Erkek'),
                              leading: Radio(
                                value: "Erkek",
                                groupValue: gender,
                                onChanged: (value) {
                                  setState(() {
                                    gender = value.toString();
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("    Evcil Hayvan Türünü Giriniz:"),
                          DropdownButton(
                            items: turler
                                .map((String e) => DropdownMenuItem(
                                      child: Text(e),
                                      value: e,
                                    ))
                                .toList(),
                            value: secilen,
                            onChanged: (gelendeger) {
                              print(gelendeger);
                              secilen = gelendeger.toString();
                              if (secilen == "Kedi") {
                                secilenHayvan = kediCinsleri;
                                secilen1 = "British Shorthair";
                              } else if (secilen == "Köpek") {
                                secilenHayvan = kopekCinsleri;
                                secilen1 = "Maltipoo";
                              } else if (secilen == "Kuş") {
                                secilenHayvan = kusCinsleri;
                                secilen1 = "Muhabbet Kuşu";
                              }
                              print(secilen);
                              setState(() {
                                print(gelendeger);
                                secilen = gelendeger!;
                              });
                            },
                            hint: Text("hgfjsd"),
                            icon: Icon(Icons.arrow_downward),
                            iconSize: 20,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("    Evcil Hayvan Cinsini Giriniz:"),
                          DropdownButton(
                            items: secilenHayvan
                                .map((String e) => DropdownMenuItem(
                                      child: Text(e),
                                      value: e,
                                    ))
                                .toList(),
                            value: secilen1,
                            onChanged: (gelendeger) {
                              print(gelendeger);
                              secilen1 = gelendeger.toString();

                              print(secilen1);
                              setState(() {
                                print(gelendeger);
                                secilen1 = gelendeger!;
                              });
                            },
                            hint: Text(""),
                            icon: Icon(Icons.arrow_downward),
                            iconSize: 20,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: CheckboxListTile(
                    value: durum2, // Text ile birlikte kutu
                    onChanged: (secim) {
                      setState(() {
                        durum2 = secim!;
                        print(durum2);
                      });
                    },
                    title: Text(
                        "Evcil hayvanım üreyebilir "), // Kutu için Text başlık
                    // Kutu için alt başlık
                    //controlAffinity: ListTileControlAffinity.leading, // kutuyu Textin soluna alır
                    activeColor: Colors.blue.shade100,
                    checkColor: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 3,
                      color: Colors.blue.shade100,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: SizedBox(
                    height: 300,
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                          target: LatLng(37.8728749, 32.4924729),
                          zoom: 14.0), //kamera ilk konumu
                      markers: Set<Marker>.of(isaret),
                      mapType: MapType.normal, // harita türü satelite uydudur
                      onMapCreated: (GoogleMapController controller) {
                        haritakontrol.complete(controller);
                      },
                      onTap: (argument) {
                        setState(() {
                          isaret = [];
                          isaret.add(Marker(
                              markerId: MarkerId(argument.toString()),
                              position: argument));
                        });
                      },
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 7,
                  decoration: InputDecoration(
                      hintText: "Açıklama",
                      filled: true,
                      fillColor: Colors.blue.shade100,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      )),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                    height: 80,
                    width: 280,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blue.shade300),
                        onPressed: () {},
                        child: Text("Kaydet"))),
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
            ]))));
  }
}
