import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

import 'main.dart';

class yeniKayit extends StatefulWidget {
  const yeniKayit({super.key});

  @override
  State<yeniKayit> createState() => _yeniKayitState();
}

class _yeniKayitState extends State<yeniKayit> {
  late String email, sifre, sifre2;
  final formkey = GlobalKey<FormState>();
  final firebaseAuth = FirebaseAuth.instance;
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
              image: AssetImage("assets/deneme2.jpg"), fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 120)),
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
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Bilgilerinizi eksiksiz doldurunuz";
                      } else {}
                    },
                    onSaved: (value) {
                      email = value!;
                    },
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
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return null;
                      } else {}
                    },
                    onSaved: (value) {
                      sifre = value!;
                    },
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                        hintText: "Şifre",
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
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return null;
                      } else {}
                    },
                    onSaved: (value) {
                      sifre2 = value!;
                    },
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                        hintText: "Şifre",
                        filled: true,
                        fillColor: Colors.blue.shade100,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                      height: 80,
                      width: 280,
                      child: ElevatedButton(
                          onPressed: () async {
                            if (formkey.currentState!.validate()) {
                              formkey.currentState!.save();
                              if (sifre == sifre2) {
                                try {
                                  var userResult = await firebaseAuth
                                      .createUserWithEmailAndPassword(
                                          email: email,
                                          password:
                                              sifre); //yeni kullancı oluşturma.
                                  print(userResult.user!.uid);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyHomePage(title: 'bos',)),
                                  );
                                } catch (e) {
                                  print(e.toString());
                                }
                              } else {
                                showAlertDialog(context, "Şifreler Aynı Değil");
                              }
                            }
                          },
                          child: Text("Kayıt Ol"))),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                      "---------------------------------- veya ----------------------------------"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SignInButton(
                    Buttons.Google,
                    text: "Google ile Kaydol",
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context, String mesaj) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("Tamam"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Hata"),
      content: Text(mesaj),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
