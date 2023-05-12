import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'anasayfa.dart';
import 'constans.dart';
import 'model.dart';

class ilk extends StatefulWidget {
  const ilk({super.key});

  @override
  State<ilk> createState() => _ilkState();
}

class _ilkState extends State<ilk> {
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    geciciVeriEkle();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:     Center(
        child: SizedBox(
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: geciciIlan.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  
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
        ),
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
