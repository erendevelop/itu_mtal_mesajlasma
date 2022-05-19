import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

String name = "Ad Ayarlanmadı";
String email = "Email Ayarlanmadı";
bool kaydetme = false;

void main() {
  runApp(Profil(name: name, email: email, kaydetme: kaydetme));
}

class Profil extends StatefulWidget {
  var name;
  var email;
  bool kaydetme;

  Profil({required this.name, required this.email, required this.kaydetme});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  final snackBar = SnackBar(
    content: Row(children: [
      Image.asset("assets/mesajlasma_icons/check.png",
          width: 14, color: Colors.white),
      SizedBox(width: 10),
      Text("Bilgiler Kaydedildi!",
          style: TextStyle(fontWeight: FontWeight.bold)),
    ]),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.green[200],
    dismissDirection: DismissDirection.down,
  );
  File _secilenDosya = File("");
  String gender = "Cinsiyet seç...";
  String birthday = "Doğum gününü gir...";
  String ekMail = "";
  String baslik = "Email adresini seç";
  var error = "";
  TextEditingController incomingName = TextEditingController();
  TextEditingController incomingMail = TextEditingController();
  TextEditingController incomingBirthday_Day = TextEditingController();
  TextEditingController incomingBirthday_Month = TextEditingController();
  TextEditingController incomingBirthday_Year = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text("Profil",
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
                icon: Image.asset("assets/mesajlasma_icons/angle-left.png",
                    width: 22, height: 22),
                onPressed: () {
                  Navigator.pop(context);
                  kaydetme = false;
                }),
          ),
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    InkWell(
                      onTap: _secimFotoGoster,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                        padding: EdgeInsets.all(1),
                        child: CircleAvatar(
                          child: _secilenDosya == " "
                              ? Image.asset(
                                  "assets/mesajlasma_icons/question-mark.png",
                                  width: 10,
                                  height: 10,
                                )
                              : null,
                          radius: 40,
                          backgroundImage: _secilenDosya != null
                              ? FileImage(_secilenDosya)
                              : null,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                          Text(email,
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 15)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Divider(height: 10, color: Colors.black54),
              ),

              //INFORMATIONS ABOUT USER

              ExpansionTile(
                trailing: Image.asset("assets/mesajlasma_icons/angle-down.png",
                    width: 13, color: Colors.grey),
                children: [
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextField(
                      controller: incomingName,
                      decoration: InputDecoration(
                        hintText: "Adını gir...",
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  SizedBox(height: 5),
                  TextButton(
                    child: Text(
                      "Adını ayarla!",
                      style: TextStyle(
                          color: Colors.lightBlue,
                          fontWeight: FontWeight.normal),
                    ),
                    onPressed: () => setState(() {
                      for (int i = 0; i < incomingName.text.length; i++) {
                        if (incomingName.text[i] == " ") {
                        } else if (incomingName.text[i] != "") {
                          name = incomingName.text;
                          break;
                        }
                      }
                    }),
                  ),
                ],
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Ad",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      )),
                ),
                subtitle: Container(
                  padding: EdgeInsets.all(2),
                  width: MediaQuery.of(context).size.width / 2,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(name),
                          Image.asset("assets/mesajlasma_icons/user.png",
                              width: 15, color: Colors.grey),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              ExpansionTile(
                trailing: Image.asset("assets/mesajlasma_icons/angle-down.png",
                    width: 13, color: Colors.grey),
                children: [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      controller: incomingMail,
                      decoration: InputDecoration(
                        hintText: "Emailini gir...",
                      ),
                    ),
                  ),
                  ExpansionTile(title: Text(baslik, style: TextStyle(fontSize: 13)),children: [
                    ListTile(
                      onTap: (){
                        setState(() {
                          baslik = "@gmail.com";
                          ekMail = "@gmail.com";
                        });
                      },
                      title: Text("@gmail.com", style: TextStyle(fontSize: 13)),
                    ),
                  ],),
                  SizedBox(height: 10),
                  TextButton(
                    child: Text("Email'ini ayarla!",
                        style: TextStyle(
                            color: Colors.lightBlue,
                            fontWeight: FontWeight.normal)),
                    onPressed: () => setState(() {
                      for (int i = 0; i < incomingMail.text.length; i++) {
                        if (incomingMail.text[i] == "") {
                        } else if (incomingMail.text[i] != "") {
                          email = incomingMail.text+ekMail;
                          break;
                        }
                      }
                    }),
                  ),
                ],
                title: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Email Adresi",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      )),
                ),
                subtitle: Container(
                  padding: EdgeInsets.all(2),
                  width: MediaQuery.of(context).size.width / 2,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(email),
                        Image.asset(
                          "assets/mesajlasma_icons/envelope.png",
                          width: 15,
                          color: Colors.grey,
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              ExpansionTile(
                trailing: Image.asset("assets/mesajlasma_icons/angle-down.png",
                    width: 13, color: Colors.grey),
                children: [
                  ListTile(
                    title: Text("Erkek"),
                    onTap: () => setState(() {
                      gender = "Erkek";
                    }),
                  ),
                  ListTile(
                    title: Text("Kadın"),
                    onTap: () => setState(() {
                      gender = "Kadın";
                    }),
                  ),
                  ListTile(
                    title: Text("Diğer"),
                    onTap: () => setState(() {
                      gender = "Diğer";
                    }),
                  ),
                ],
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Cinsiyet",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      )),
                ),
                subtitle: Container(
                  padding: EdgeInsets.all(2),
                  width: MediaQuery.of(context).size.width / 2,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(gender),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              ListTile(
                onTap: () => showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    actions: [
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: TextField(
                              controller: incomingBirthday_Day,
                              decoration: InputDecoration(
                                hintText: "Gün...",
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            flex: 3,
                            child: TextField(
                              controller: incomingBirthday_Month,
                              decoration: InputDecoration(
                                hintText: "Ay...",
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            flex: 3,
                            child: TextField(
                              controller: incomingBirthday_Year,
                              decoration: InputDecoration(
                                hintText: "Yıl...",
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Center(
                        child: Column(
                          children: [
                            TextButton(
                              onPressed: () {
                                if (int.parse(incomingBirthday_Year.text) >
                                    1910) {
                                  if (int.parse(incomingBirthday_Month.text) <=
                                      12) {
                                    if (int.parse(incomingBirthday_Month.text) %
                                            2 ==
                                        0) {
                                      if (int.parse(
                                              incomingBirthday_Month.text) ==
                                          8) {
                                        if (int.parse(incomingBirthday_Day
                                                    .text) <=
                                                31 &&
                                            int.parse(
                                                    incomingBirthday_Day.text) >
                                                0) {
                                          birthday =
                                              "${int.parse(incomingBirthday_Day.text)}.${int.parse(incomingBirthday_Month.text)}.${int.parse(incomingBirthday_Year.text)}";
                                          setState(() {
                                            error = "";
                                          });
                                          Navigator.pop(context);
                                        }
                                      } else {
                                        if (int.parse(incomingBirthday_Day
                                                    .text) <=
                                                30 &&
                                            int.parse(
                                                    incomingBirthday_Day.text) >
                                                0) {
                                          birthday =
                                              "${int.parse(incomingBirthday_Day.text)}.${int.parse(incomingBirthday_Month.text)}.${int.parse(incomingBirthday_Year.text)}";
                                          setState(() {
                                            error = "";
                                          });
                                          Navigator.pop(context);
                                        }
                                      }
                                    } else if (int.parse(
                                                incomingBirthday_Month.text) %
                                            2 ==
                                        1) {
                                      if (int.parse(
                                              incomingBirthday_Month.text) ==
                                          2) {
                                        if (int.parse(incomingBirthday_Day
                                                    .text) <=
                                                28 &&
                                            int.parse(
                                                    incomingBirthday_Day.text) >
                                                0) {
                                          birthday =
                                              "${int.parse(incomingBirthday_Day.text)}.${int.parse(incomingBirthday_Month.text)}.${int.parse(incomingBirthday_Year.text)}";
                                          setState(() {
                                            error = "";
                                          });
                                          Navigator.pop(context);
                                        }
                                      } else {
                                        if (int.parse(incomingBirthday_Day
                                                    .text) <=
                                                31 &&
                                            int.parse(
                                                    incomingBirthday_Day.text) >
                                                0) {
                                          birthday =
                                              "${int.parse(incomingBirthday_Day.text)}.${int.parse(incomingBirthday_Month.text)}.${int.parse(incomingBirthday_Year.text)}";
                                          setState(() {
                                            error = "";
                                          });
                                          Navigator.pop(context);
                                        } else {
                                          setState(() {
                                            error = "Yanlış giriş!";
                                          });
                                        }
                                      }
                                    } else {
                                      setState(() {
                                        error = "Yanlış giriş!";
                                      });
                                    }
                                  } else {
                                    setState(() {
                                      error = "Yanlış giriş!";
                                    });
                                  }
                                } else {
                                  setState(() {
                                    error = "Yanlış giriş!";
                                  });
                                }
                              },
                              child: Text("Doğum gününü ayarla!",
                                  style: TextStyle(
                                      color: Colors.lightBlueAccent,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Text(error,
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 4),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                hoverColor: Colors.transparent,
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Doğum Günü",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      )),
                ),
                subtitle: Container(
                  padding: EdgeInsets.all(2),
                  width: MediaQuery.of(context).size.width / 2,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(birthday,
                            style: TextStyle(fontWeight: FontWeight.values[6])),
                        Image.asset(
                          "assets/mesajlasma_icons/calendar.png",
                          width: 15,
                          color: Colors.grey,
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    kaydetme = true;
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: Text("Bilgileri Kaydet",
                      style: TextStyle(
                          color: Colors.lightBlue,
                          fontWeight: FontWeight.normal,
                          fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _secimFotoGoster() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text("Galeriden Fotoğraf Seç"),
              onTap: () {
                _secimYukle(ImageSource.gallery);
                Navigator.pop(context);
              },
            ),
            Divider(height: 4),
            ListTile(
              title: Text("Fotoğraf Çek"),
              onTap: () {
                _secimYukle(ImageSource.camera);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _secimYukle(ImageSource source) async {
    final picker = ImagePicker();
    final secilen = await picker.pickImage(source: source);
    setState(() {
      if (secilen != null) {
        _secilenDosya = File(secilen.path);
      }
    });
  }
}
