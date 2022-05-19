import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:itumtalmesajlasma/mesajlasma/ana_ekran.dart';

void main() => runApp(MyApp());
var likesayisi = 0;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/kesfet": (context) => Kesfet(),
        "/siyah_tema": (context) => Home(),
        "/buyuk_kesfet": (context) => KesfetBuyukHome(),
        "/profil": (context) => KullaniciEkran(),
        "/yorumlar": (context) => Yorumlar(),
      },
      initialRoute: "/siyah_tema",
      title: "İTÜ MTAL Sosyal",
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => runApp(AnaEkran()),
          backgroundColor: Colors.lightBlue,
          child: Image.asset("assets/at.png", width: 15),
        ),
        endDrawer: Center(
          child: Container(
            height: 350,
            width: 350,
            child: DrawerHeader(
              child: Drawer(
                child: Mesajlar(),
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            Builder(builder: (context) {
              return IconButton(
                icon:
                    Image.asset("assets/sosyalmedya_icons/list.png", width: 20),
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            }),
          ],
          title: Text(
            "İTÜ MTAL Sosyal",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Body(),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Image.asset("assets/sosyalmedya_icons/home-siyah.png",
                  width: 17),
              onPressed: () => Navigator.pushNamed(context, "/siyah_tema"),
            ),
            IconButton(
              icon: Icon(Icons.search_outlined, color: Colors.black),
              onPressed: () => Navigator.pushNamed(context, "/kesfet"),
            ),
            IconButton(
              icon: Image.asset("assets/sosyalmedya_icons/user.png", width: 17),
              onPressed: () => Navigator.pushNamed(context, "/profil"),
            ),
          ],
        ),
      ),
    );
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  like() {
    setState(() {
      if (likesayisi == 0) {
        likesayisi = 1;
      } else {
        likesayisi = 0;
      }
    });
  }

  Widget build(BuildContext context) {
    List resimlerAna = [
      "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/spider-man-movies-in-order-2004-1631199989.jpeg?crop=0.563xw:1.00xh;0.185xw,0&resize=768:*",
      "https://cdn.vox-cdn.com/thumbor/N5UA0JfW6Zq2r_suuyMukdt9PTo=/0x0:3000x2000/1220x813/filters:focal(1260x760:1740x1240):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/64062111/1_LGFTlvUlC8iJ5mi-UPF7Uw.0.0.0.jpeg",
    ];

    return SafeArea(
      child: Container(
        child: ListView(
          children: [
            for (int i = 0; i < resimlerAna.length; i++)
              Card(
                elevation: 0,
                color: Colors.white,
                child: Column(
                  children: [
                    InkWell(
                      child: Image.network(resimlerAna[i]),
                      onDoubleTap: like,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(""),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Text(
                            "$likesayisi beğenme",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          IconButton(
                            onPressed: like,
                            icon: Image.asset(
                                "assets/sosyalmedya_icons/star.png",
                                width: 20),
                          ),
                          SizedBox(
                            width: 10,
                            height: 0,
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Yorumlar()));
                            },
                            icon: Image.asset(
                                "assets/sosyalmedya_icons/comment-alt.png",
                                width: 20),
                          ),
                          SizedBox(
                            width: 20,
                            height: 0,
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Send()));
                            },
                            icon: Image.asset(
                                "assets/sosyalmedya_icons/paper-plane.png",
                                width: 20),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: TextField(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Yorumlar()));
                        },
                        decoration: InputDecoration(
                          labelText: "Yorum yaz...",
                          labelStyle: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            // İkinci Card Widget'ı
          ],
        ),
      ),
    );
  }
}

class Yorumlar extends StatelessWidget {
  const Yorumlar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Image.asset("assets/sosyalmedya_icons/angle-left.png",
                width: 20),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Yorumlar",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black,
              fontSize: 21,
            ),
          ),
        ),
        body: Yorum(),
      ),
    );
  }
}

class Yorum extends StatefulWidget {
  const Yorum({Key? key}) : super(key: key);

  @override
  _YorumState createState() => _YorumState();
}

class _YorumState extends State<Yorum> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  leading: InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle
                      ),
                      padding: EdgeInsets.all(0.7),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                            "assets/sosyalmedya_icons/kedi-adam.png"),
                        radius: 20,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Profil()));
                    },
                  ),
                  onTap: () {},
                  subtitle: Text(
                    "ne mal adamsın lan",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.values[3],
                    ),
                  ),
                  title: Text(
                    "yagizturhann",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.values[6],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: "Yorum Yaz...",
                            labelStyle: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                          autocorrect: true,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Gönder",
                          style: TextStyle(color: Colors.lightBlue),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Send extends StatelessWidget {
  const Send({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Image.asset("assets/sosyalmedya_icons/angle-left.png",
                width: 20),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            "Bu gönderiyi birine gönder",
            style: TextStyle(
              fontWeight: FontWeight.w300,
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: Arkadaslar(),
      ),
    );
  }
}

class Arkadaslar extends StatefulWidget {
  const Arkadaslar({Key? key}) : super(key: key);

  @override
  _ArkadaslarState createState() => _ArkadaslarState();
}

class _ArkadaslarState extends State<Arkadaslar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: ListView(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListTile(
                      title: Text("Mustafa Yağız Turhan",
                          style: TextStyle(color: Colors.black)),
                      subtitle: Text("yagizturhann",
                          style: TextStyle(color: Colors.black)),
                      leading: Container(
                        decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle
                        ),
                        padding: EdgeInsets.all(0.7),
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                              "assets/sosyalmedya_icons/kedi-adam.png"),
                          radius: 20,
                        ),
                      ),
                      trailing: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Arkadas1()),
                          );
                        },
                        child: Text(
                          "Gönder",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Arkadas1 extends StatelessWidget {
  const Arkadas1({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Image.asset("assets/sosyalmedya_icons/angle-left.png",
                width: 20),
          ),
          backgroundColor: Colors.white,
          title: ListTile(
            title: Text(
              "Mustafa Yağız Turhan",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            subtitle: Text(
              "yagizturhann",
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
            ),
          ),
        ),
        body: Arkadas1body(),
      ),
    );
  }
}

class Arkadas1body extends StatefulWidget {
  const Arkadas1body({Key? key}) : super(key: key);
  @override
  _Arkadas1bodyState createState() => _Arkadas1bodyState();
}

class _Arkadas1bodyState extends State<Arkadas1body> {
  List mesajlar = [];
  TextEditingController mesaj = TextEditingController();

  mesajGonder(String metin) {
    setState(() {
      mesajlar.insert(0, metin);
      mesaj.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 20,
        ),
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                reverse: true,
                itemCount: mesajlar.length,
                itemBuilder: (context, int indeksNumarasi) => Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(5),
                  child: Text(
                    mesajlar[indeksNumarasi],
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.lightBlueAccent[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Divider(
              height: 20,
              color: Colors.white,
              thickness: 1.5,
            ),
            Row(
              children: <Widget>[
                Flexible(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Mesaj Gönder...",
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    controller: mesaj,
                    autocorrect: true,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: (){
                    for (int i = 0;
                    i < mesaj.text.length;
                    i++) {
                      if (mesaj.text[i] == " ") {
                      } else if (mesaj.text[i] != " ") {
                        mesajGonder(mesaj.text);
                        break;
                      }
                    }
                  },
                  child: Text(
                    "Gönder",
                    style: TextStyle(color: Colors.lightBlue),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Profil extends StatelessWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProfilEkran(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon:
              Image.asset("assets/sosyalmedya_icons/angle-left.png", width: 20),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Profil",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Image.asset("assets/sosyalmedya_icons/home.png", width: 17),
            onPressed: () => Navigator.pushNamed(context, "/siyah_tema"),
          ),
          IconButton(
            icon: Icon(Icons.search_outlined, color: Colors.black),
            onPressed: () => Navigator.pushNamed(context, "/kesfet"),
          ),
          IconButton(
            icon: Image.asset("assets/sosyalmedya_icons/user.png", width: 17),
            onPressed: () => Navigator.pushNamed(context, "/profil"),
          ),
        ],
      ),
    );
  }
}

class ProfilEkran extends StatefulWidget {
  const ProfilEkran({Key? key}) : super(key: key);
  @override
  _ProfilEkranState createState() => _ProfilEkranState();
}

class _ProfilEkranState extends State<ProfilEkran> {
  @override
  like() {
    setState(() {
      if (likesayisi == 0) {
        likesayisi = 1;
      } else {
        likesayisi = 0;
      }
    });
  }

  Widget build(BuildContext context) {
    List resimlerP = [
      "https://cdn.vox-cdn.com/thumbor/L3uWt_p1CahG4rmMopcw2Q6gkxc=/104x0:3104x2000/1400x1400/filters:focal(104x0:3104x2000):format(jpeg)/cdn.vox-cdn.com/uploads/chorus_image/image/45660742/spiderman.0.0.jpg",
      "https://c.tenor.com/i6oVpJW5PM8AAAAC/kamuran-sins.gif",
      "https://sm.ign.com/t/ign_tr/screenshot/default/homecoming-genel_yqkj.1280.jpg"
    ];

    return SafeArea(
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(right: 30),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle
                          ),
                          padding: EdgeInsets.all(0.7),
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                                "assets/sosyalmedya_icons/kedi-adam.png"),
                            radius: 50,
                          ),
                        ),
                    ),
                    Text("5\nGönderi",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.values[5],
                          fontSize: 16,
                        )),
                    Text("243\nTakipçi",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.values[5],
                          fontSize: 16,
                        )),
                    Text("168\nTakip Edilen",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.values[5],
                          fontSize: 16,
                        )),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 28,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "yagizturhann",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.values[4]),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      "ben malım",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.values[3],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: Text("Takip Et",
                        style: TextStyle(
                          color: Colors.white,
                        )),
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.lightBlue)),
                  ),
                ],
              ),
              for (int i = 0; i < resimlerP.length; i++)
                Card(
                  color: Colors.white,
                  elevation: 10,
                  child: Column(
                    children: [
                      InkWell(
                        child: Image.network(resimlerP[i]),
                        onDoubleTap: like,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(""),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Text(
                              "$likesayisi beğenme",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            IconButton(
                              onPressed: like,
                              icon: Image.asset(
                                  "assets/sosyalmedya_icons/star.png",
                                  width: 20),
                            ),
                            SizedBox(
                              width: 10,
                              height: 0,
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Yorumlar()));
                              },
                              icon: Image.asset(
                                  "assets/sosyalmedya_icons/comment-alt.png",
                                  width: 20),
                            ),
                            SizedBox(
                              width: 20,
                              height: 0,
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Send()));
                              },
                              icon: Image.asset(
                                  "assets/sosyalmedya_icons/paper-plane.png",
                                  width: 20),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: TextField(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Yorumlar()));
                          },
                          decoration: InputDecoration(
                            labelText: "Yorum yaz...",
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class KullaniciEkran extends StatelessWidget {
  const KullaniciEkran({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KullaniciProfil(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          Builder(builder: (BuildContext context) {
            return IconButton(
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              icon: Image.asset("assets/sosyalmedya_icons/list.png", width: 20),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          })
        ],
        leading: IconButton(
            icon: Image.asset("assets/sosyalmedya_icons/angle-left.png",
                width: 20),
            onPressed: () => Navigator.pop(context)),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Profilim",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      endDrawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              padding: EdgeInsets.all(0),
              child: Container(
                child: Center(
                  child: Text("Kullanıcı Menüsü",
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
                ),
                color: Colors.lightBlueAccent,
                width: double.infinity,
              ),
            ),
            ListTile(
              leading: Image.asset("assets/sosyalmedya_icons/comment-alt.png",
                  width: 20),
              onTap: () {},
              title: Text("Geri Bildirim Gönder"),
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
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Image.asset("assets/sosyalmedya_icons/home.png", width: 17),
            onPressed: () => Navigator.pushNamed(context, "/siyah_tema"),
          ),
          IconButton(
            icon: Icon(Icons.search_outlined, color: Colors.black),
            onPressed: () => Navigator.pushNamed(context, "/kesfet"),
          ),
          IconButton(
            icon: Image.asset("assets/sosyalmedya_icons/user-siyah.png",
                width: 17),
            onPressed: () => Navigator.pushNamed(context, "/profil"),
          ),
        ],
      ),
    );
  }
}

class KullaniciProfil extends StatefulWidget {
  const KullaniciProfil({Key? key}) : super(key: key);

  @override
  _KullaniciProfilState createState() => _KullaniciProfilState();
}

class _KullaniciProfilState extends State<KullaniciProfil> {
  @override
  like() {
    setState(() {
      if (likesayisi == 0) {
        likesayisi = 1;
      } else {
        likesayisi = 0;
      }
    });
  }

  Widget build(BuildContext context) {
    List resimlerK = [
      "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/spider-man-movies-in-order-2017-1631201974.jpeg?crop=0.6666666666666666xw:1xh;center,top&resize=768:*",
      "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/best-movies-for-kids-spiderverse-1594997066.jpg?crop=0.7506666666666667xw:1xh;center,top&resize=768:*",
      "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/spider-man-movies-in-order-2007-1631200153.jpeg?crop=0.563xw:1.00xh;0.233xw,0&resize=768:*"
    ];

    return SafeArea(
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 30),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle
                        ),
                        padding: EdgeInsets.all(0.7),
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                              "assets/sosyalmedya_icons/kedi-adam.png"),
                          radius: 50,
                        ),
                      ),
                    ),
                    Text("5\nGönderi",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.values[5],
                          fontSize: 16,
                        )),
                    Text("243\nTakipçi",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.values[5],
                          fontSize: 16,
                        )),
                    Text("168\nTakip Edilen",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.values[5],
                          fontSize: 16,
                        )),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 28,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "erenmturhan",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.values[4]),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      "ben de malım",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.values[3],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: Text(
                      "Profilini Düzenle",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.lightBlue),
                    ),
                  ),
                ],
              ),
              for (int i = 0; i < resimlerK.length; i++)
                Card(
                  color: Colors.white,
                  elevation: 10,
                  child: Column(
                    children: [
                      InkWell(
                        child: Image.network(resimlerK[i]),
                        onDoubleTap: like,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(""),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Text(
                              "$likesayisi beğenme",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            IconButton(
                              onPressed: like,
                              icon: Image.asset(
                                  "assets/sosyalmedya_icons/star.png",
                                  width: 20),
                            ),
                            SizedBox(
                              width: 10,
                              height: 0,
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Yorumlar()));
                              },
                              icon: Image.asset(
                                  "assets/sosyalmedya_icons/comment-alt.png",
                                  width: 20),
                            ),
                            SizedBox(
                              width: 20,
                              height: 0,
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Send()));
                              },
                              icon: Image.asset(
                                  "assets/sosyalmedya_icons/paper-plane.png",
                                  width: 20),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: TextField(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Yorumlar()));
                          },
                          decoration: InputDecoration(
                            labelText: "Yorum yaz...",
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class Mesajlar extends StatelessWidget {
  const Mesajlar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon:
              Image.asset("assets/sosyalmedya_icons/angle-left.png", width: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Hızlı Sobhet", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white24,
        elevation: 0,
      ),
      body: MesajListesi(),
      backgroundColor: Colors.white24,
    );
  }
}

class MesajListesi extends StatefulWidget {
  const MesajListesi({Key? key}) : super(key: key);

  @override
  _MesajListesiState createState() => _MesajListesiState();
}

class _MesajListesiState extends State<MesajListesi> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            for (int i = 0; i < 3; i++)
              ListTile(
                title: Text(
                  "yagizturhann",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.values[3],
                    fontSize: 18,
                  ),
                ),
                subtitle: Text(
                  "yagizturhann sana bir gönderi gönderdi.",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.values[1],
                    fontSize: 10,
                  ),
                ),
                leading:
                Container(
                  decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle
                  ),
                  padding: EdgeInsets.all(0.7),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                        "assets/sosyalmedya_icons/kedi-adam.png"),
                    radius: 20,
                  ),
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Arkadas1(),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class Kesfet extends StatelessWidget {
  const Kesfet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KesfetBody(),
      appBar: AppBar(
        leading: IconButton(
          icon:
              Image.asset("assets/sosyalmedya_icons/angle-left.png", width: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "İTÜ MTAL Sosyal",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Image.asset("assets/sosyalmedya_icons/home.png", width: 17),
            onPressed: () => Navigator.pushNamed(context, "/siyah_tema"),
          ),
          IconButton(
            icon: Icon(Icons.search_outlined, color: Colors.black),
            onPressed: () => Navigator.pushNamed(context, "/kesfet"),
          ),
          IconButton(
            icon: Image.asset("assets/sosyalmedya_icons/user.png", width: 17),
            onPressed: () => Navigator.pushNamed(context, "/profil"),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}

class KesfetBody extends StatefulWidget {
  const KesfetBody({Key? key}) : super(key: key);

  @override
  _KesfetBodyState createState() => _KesfetBodyState();
}

class _KesfetBodyState extends State<KesfetBody> {
  like() {
    setState(() {
      if (likesayisi == 0) {
        likesayisi = 1;
      } else {
        likesayisi = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var ekran = MediaQuery.of(context).size;
    var liste = [
      InkWell(
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => KesfetBuyukHome())),
        child: Container(
          height: ekran.height / 3,
          width: ekran.width / 4,
          child: Image.network(
              "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/spider-man-movies-in-order-2017-1631201974.jpeg?crop=0.6666666666666666xw:1xh;center,top&resize=768:*"),
        ),
      ),
      InkWell(
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => KesfetBuyukHome())),
        child: Container(
          height: ekran.height / 3,
          width: ekran.width / 4,
          child: Image.network(
              "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/best-movies-for-kids-spiderverse-1594997066.jpg?crop=0.7506666666666667xw:1xh;center,top&resize=768:*"),
        ),
      ),
      InkWell(
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => KesfetBuyukHome())),
        child: Container(
          height: ekran.height / 3,
          width: ekran.width / 4,
          child: Image.network(
              "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/spider-man-movies-in-order-2007-1631200153.jpeg?crop=0.563xw:1.00xh;0.233xw,0&resize=768:*"),
        ),
      ),
    ];
    return SafeArea(
      child: ListView(
        children: [
          for (int i = 0; i < 5; i++)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                liste[0],
                liste[1],
                liste[2],
              ],
            ),
        ],
      ),
    );
  }
}

class KesfetBuyukHome extends StatelessWidget {
  const KesfetBuyukHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        endDrawer: Center(
          child: Container(
            height: 350,
            width: 350,
            child: DrawerHeader(
              child: Drawer(
                child: Mesajlar(),
              ),
            ),
          ),
        ),
        appBar: AppBar(
          leading: IconButton(
              icon: Image.asset("assets/sosyalmedya_icons/angle-left.png",
                  width: 20),
              onPressed: () => Navigator.pop(context)),
          title: Text(
            "İTÜ MTAL Sosyal",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Image.asset("assets/sosyalmedya_icons/home.png", width: 17),
              onPressed: () => Navigator.pushNamed(context, "/siyah_tema"),
            ),
            IconButton(
              icon: Icon(Icons.search_outlined, color: Colors.black),
              onPressed: () => Navigator.pushNamed(context, "/kesfet"),
            ),
            IconButton(
              icon: Image.asset("assets/sosyalmedya_icons/user.png", width: 17),
              onPressed: () => Navigator.pushNamed(context, "/profil"),
            ),
          ],
        ),
        body: KesfetBuyuk(),
        backgroundColor: Colors.white,
      ),
    );
  }
}

class KesfetBuyuk extends StatefulWidget {
  const KesfetBuyuk({Key? key}) : super(key: key);

  @override
  _KesfetBuyukState createState() => _KesfetBuyukState();
}

class _KesfetBuyukState extends State<KesfetBuyuk> {
  like() {
    setState(() {
      if (likesayisi == 0) {
        likesayisi = 1;
      } else {
        likesayisi = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List resimlerK = [
      "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/spider-man-movies-in-order-2017-1631201974.jpeg?crop=0.6666666666666666xw:1xh;center,top&resize=768:*",
      "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/best-movies-for-kids-spiderverse-1594997066.jpg?crop=0.7506666666666667xw:1xh;center,top&resize=768:*",
      "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/spider-man-movies-in-order-2007-1631200153.jpeg?crop=0.563xw:1.00xh;0.233xw,0&resize=768:*"
    ];
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            for (int i = 0; i < 7; i++)
              for (int j = 0; j < resimlerK.length; j++)
                Card(
                  color: Colors.white,
                  elevation: 10,
                  child: Column(
                    children: [
                      InkWell(
                        child: Image.network(resimlerK[j]),
                        onDoubleTap: like,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(""),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Text(
                              "$likesayisi beğenme",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            IconButton(
                              onPressed: like,
                              icon: Image.asset(
                                  "assets/sosyalmedya_icons/star.png",
                                  width: 20),
                            ),
                            SizedBox(
                              width: 10,
                              height: 0,
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Yorumlar()));
                              },
                              icon: Image.asset(
                                  "assets/sosyalmedya_icons/comment-alt.png",
                                  width: 20),
                            ),
                            SizedBox(
                              width: 20,
                              height: 0,
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Send()));
                              },
                              icon: Image.asset(
                                  "assets/sosyalmedya_icons/paper-plane.png",
                                  width: 20),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: TextField(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Yorumlar()));
                          },
                          decoration: InputDecoration(
                            labelText: "Yorum yaz...",
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
