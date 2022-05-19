import 'package:flutter/material.dart';
import 'ayarlar.dart';
import 'gruplar.dart';
import 'package:itumtalmesajlasma/sosyal_medya/sosyalmedya.dart';
List grupIsimleri = ["9/A öğrenci", "Çalışkan çocuklar"];

void main() => runApp(AnaEkran());

class AnaEkran extends StatelessWidget {
  const AnaEkran({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnaEkranHome(),
      debugShowCheckedModeBanner: false,
      routes: {
        "/anaekran": (context) => AnaEkran(),
        "/ayarlar": (context) => Ayarlar(),
        "/grup_1": (context) => Grup1(grupIsmi: grupIsimleri[0],),
        "/grup_2": (context) => Grup2(grupIsmi: grupIsimleri[1],),
      },
    );
  }
}

class AnaEkranHome extends StatefulWidget {
  const AnaEkranHome({Key? key}) : super(key: key);

  @override
  State<AnaEkranHome> createState() => _AnaEkranHomeState();
}

class _AnaEkranHomeState extends State<AnaEkranHome> {
  @override
  List isimler = ["Ana Sayfa", "Fotoğraf Ekle", "Ayarlar"];
  List fonksiyonlar = ["/anaekran", "", "/ayarlar"];
  List ikonlar = [
    "assets/mesajlasma_icons/home-siyah.png",
    "assets/mesajlasma_icons/add.png",
    "assets/mesajlasma_icons/settings.png"
  ];

  List sonMesajAtanUser = ["şeyma itü", "Siz"];
  List sonMesajlar = ["konuları biri atabilir mi", "rust gitti o7"];
  List gruplar = ["/grup_1", "/grup_2"];

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset("assets/at.png", width: 15),
            ],
          ),
        ),
        onPressed: () => runApp(MyApp()),
        backgroundColor: Colors.lightBlueAccent,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              padding: EdgeInsets.all(0),
              child: Container(
                child: Center(
                  child: Text("Seçenekler",
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
                ),
                color: Colors.lightBlueAccent,
                width: double.infinity,
              ),
            ),
            for (int k = 0; k < isimler.length; k++)
              ListTile(
                title: Text(isimler[k]),
                leading: Image.asset(ikonlar[k], width: 18, height: 18),
                onTap: () {
                  if (k != 0 && k != 1)
                    Navigator.pushNamed(context, fonksiyonlar[k]);
                },
                trailing: Image.asset("assets/mesajlasma_icons/angle-right.png", width: 13),
              ),
            Expanded(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset("assets/mesajlasma_icons/itümtal logo.jpg",
                          width: 30, height: 30),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Powered by ITU MTAL - 2022",
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
      appBar: AppBar(
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            icon: Image.asset("assets/mesajlasma_icons/list.png", width: 20, height: 20),
            onPressed: () => Scaffold.of(context).openDrawer(),
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        }),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text("İTÜ MTAL Mesajlaşma",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
      body: ListView(
        children: [
          Divider(height: 4, color: Colors.black54),
          for (int g = 0; g < gruplar.length; g++)
            ListTile(
              leading: Image.asset("assets/mesajlasma_icons/users.png", width: 20, height: 20),
              onTap: () => Navigator.pushNamed(context, gruplar[g]),
              subtitle: Text("${sonMesajAtanUser[g]}: ${sonMesajlar[g]}"),
              title: Text(grupIsimleri[g]),
            ),
          Divider(height: 4, color: Colors.black54),
        ],
      ),
    );
  }
}
