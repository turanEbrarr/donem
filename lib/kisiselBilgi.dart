import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:time_range/time_range.dart';



class kisiselBilgi extends StatefulWidget {
  const kisiselBilgi({super.key});

  @override
  State<kisiselBilgi> createState() => _kisiselBilgiState();
}

class _kisiselBilgiState extends State<kisiselBilgi> {
 
  Completer<GoogleMapController> haritakontrol = Completer();
  var ilkkonum =
      CameraPosition(target: LatLng(38.7412482, 26.1844276), zoom: 4);
  List<Marker> isaret = <Marker>[];

  bool durum2 = false;
  String? gender = "";
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
            //isim soyisim
            //telefon numarası
            //e-mail
            //meslek
            //konum
            //radio button ->daha önce hayvan sahiplendi mi
            //yaş
            //checkbox ->evde başka hayvan varmı  --------- eğer var seçerse açıklama açılsın
            //multiline text varsa açıklama
            //görüşme için uygun saatler time picker kullanılacak

            Padding(padding: EdgeInsets.only(top: 100)),
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "İsim Soyisim Giriniz",
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
                    hintText: "Yaşınızı giriniz",
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
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    hintText: "Telefon Numarası Giriniz",
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
                decoration: InputDecoration(
                    hintText: "E-Mail Giriniz",
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
                decoration: InputDecoration(
                    hintText: "Mesleğinizi giriniz",
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
       
            Padding(padding: EdgeInsets.only(top: 20)),
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
                      "Evde başka evcil hayvan var mı ? "), // Kutu için Text başlık
                  // Kutu için alt başlık
                  //controlAffinity: ListTileControlAffinity.leading, // kutuyu Textin soluna alır
                  activeColor: Colors.blue.shade100,
                  checkColor: Colors.black,
                ),
              ),
            ),
          
            Padding(padding: EdgeInsets.only(top: 20)),
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: SizedBox(
                    height: 50,
                    child: Row(
                      children: [
                        Text("      Daha önce hayvan sahiplendiniz mi? "),
                      ],
                    ),
                  )),
            ),
            Padding(padding: EdgeInsets.only(top: 5)),
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ListTile(
                        title: const Text('Evet'),
                        leading: Radio(
                          value: "Evet",
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
                        title: const Text('Hayır'),
                        leading: Radio(
                          value: "Hayır",
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
            Padding(padding: EdgeInsets.only(top: 20)),
                       Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: SizedBox(
                    height: 50,
                    child: Row(
                      children: [
                        Text("      Hangi saatler arasında görüşmek için uygunsunuz?"),
                      ],
                    ),
                  )),
            ),
            Padding(padding: EdgeInsets.only(top: 5)),
            Padding(
              padding: const EdgeInsets.only(right: 10,left: 10),
              child: Container(
                decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(10.0)),
                child: Padding(
                  padding: const EdgeInsets.only(right: 10,left: 10),
                  child: TimeRange(
                    
                    
                    titlePadding: 20,
                    textStyle: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black87),
                    activeTextStyle:
                        TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                    borderColor: Colors.black,
                    backgroundColor: Colors.transparent,
                    activeBackgroundColor: Colors.blueGrey,
                    firstTime: TimeOfDay(hour: 14, minute: 30),
                    lastTime: TimeOfDay(hour: 20, minute: 00),
                    timeStep: 60,
                    timeBlock: 30,
                    onRangeCompleted: (range) => setState(() => print(range)),
                  ),
                ),
              ),
            ),
              Padding(padding: EdgeInsets.only(top: 20)),
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 5,
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
                          Padding(padding: EdgeInsets.only(top: 20)),
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
          ],
          ),
        ),
      ),
    );
  }
}
/*
import 'package:flutter/material.dart';

class kisiselBilgi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return anaSinif()
  }
}
class anaSinif extends StatefulWidget {
  const anaSinif({super.key});

  @override
  State<anaSinif> createState() => _anaSinifState();
}

class _anaSinifState extends State<anaSinif> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
*/
