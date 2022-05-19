import 'package:flutter/material.dart';
import 'package:itumtalmesajlasma/mesajlasma/profil.dart';
import 'dart:io';
import 'ana_ekran.dart';

String name1 = "Ad Ayarlanmadı";
String email1 = "Email Ayarlanmadı";
File file1 = File("");

class Ayarlar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AyarlarHome(name1: name, email1: email),
      debugShowCheckedModeBanner: false,
      routes: {
        "/anaekran" : (context) => AnaEkran(),
        "/ayarlar": (context) => Ayarlar(),
      },
    );
  }
}

class AyarlarHome extends StatefulWidget {
  var name1;
  var email1;
  AyarlarHome({required this.name1, required this.email1});
  @override
  _AyarlarHomeState createState() => _AyarlarHomeState();
}

class _AyarlarHomeState extends State<AyarlarHome> {
  @override

  List isimler = ["Ana Sayfa", "Fotoğraf Ekle", "Ayarlar"];
  List ikonlar = ["assets/mesajlasma_icons/home.png", "assets/mesajlasma_icons/add.png", "assets/mesajlasma_icons/settings-siyah.png"];
  List fonksiyonlar = ["/anaekran", "", "/ayarlar"];
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              DrawerHeader(
                padding: EdgeInsets.all(0),
                child: Container(
                  child: Center(
                    child: Text("Seçenekler",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold)),
                  ),
                  color: Colors.lightBlueAccent,
                  width: double.infinity,
                ),
              ),
              for(int a = 0; a<isimler.length;a++)
                ListTile(
                  leading: Image.asset(ikonlar[a],
                      width: 18, height: 18),
                  onTap: () {
                    if(a != 1 && a!=2)
                      Navigator.pushNamed(context, "/anaekran");
                  },
                  title: Text(isimler[a]),
                  trailing: Image.asset("assets/mesajlasma_icons/angle-right.png",
                      width: 13, height: 13),
                ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset("assets/mesajlasma_icons/itümtal logo.jpg",
                          width: 30, height: 30),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Powered by ITU MTAL - 2022", style: TextStyle(fontSize: 13),),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Image.asset("assets/mesajlasma_icons/list.png",
                    scale: 25, width: 20, height: 20),
                onPressed: () => Scaffold.of(context).openDrawer(),
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("Ayarlar",
              style: TextStyle(
                  fontWeight: FontWeight.values[6], color: Colors.black)),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                    Container(
                      padding: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        radius: 42,
                        backgroundImage: FileImage(file1),
                      ),
                    ),
                  SizedBox(width: 20),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name1,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.values[5],
                            fontSize: 22),
                      ),
                      Text(
                        email1,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.values[2],
                            fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(height: 7, color: Colors.black),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  ListTile(
                    leading: Image.asset("assets/mesajlasma_icons/user.png", width: 22, height: 22),
                    title: Text("Profil"),
                    trailing: Image.asset("assets/mesajlasma_icons/angle-right.png", width: 17, height: 17),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Profil(
                            name: name,
                            email: email,
                            kaydetme: kaydetme,
                          ),
                        ),
                      );
                      setState(() {
                        name1 = name;
                        email1 = email;
                      });
                    },
                  ),
                  ListTile(
                    leading:
                        Image.asset("assets/mesajlasma_icons/lock.png", width: 22, height: 22),
                    title:
                        Text("Gizlilik", style: TextStyle(color: Colors.black)),
                    trailing: Image.asset("assets/mesajlasma_icons/angle-right.png",
                        width: 17, height: 17),
                  ),
                  ListTile(
                    leading: Image.asset("assets/mesajlasma_icons/shield-check.png",
                        width: 22, height: 22),
                    title:
                        Text("Güvenlik", style: TextStyle(color: Colors.black)),
                    trailing: Image.asset("assets/mesajlasma_icons/angle-right.png",
                        width: 17, height: 17),
                  ),
                  ListTile(
                    leading:
                        Image.asset("assets/mesajlasma_icons/bulb.png", width: 22, height: 22),
                    title: Text("Açık Temaya Geç",
                        style: TextStyle(color: Colors.black)),
                    trailing: Image.asset("assets/mesajlasma_icons/angle-right.png",
                        width: 17, height: 17),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Image.asset("assets/mesajlasma_icons/picture.png", width: 22),
                    title: Text("Sohbet Arka Planı Ayarla"),
                    trailing: Image.asset("assets/mesajlasma_icons/angle-right.png", width: 17),
                    onTap: (){},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
