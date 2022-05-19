import 'package:flutter/material.dart';

class Grup1 extends StatefulWidget {
  var grupIsmi;
  Grup1({required this.grupIsmi});

  @override
  _Grup1State createState() => _Grup1State();
}

class _Grup1State extends State<Grup1> {
  @override
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
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.grupIsmi,
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            icon: Image.asset("assets/mesajlasma_icons/angle-left.png", width: 17, height: 17),
            onPressed: () => Navigator.pop(context),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.white,
        body: Padding(
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
                  itemBuilder: (context, int indeksNumarasi) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.teal[200],
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: ListTile(
                          subtitle: Text(
                            mesajlar[indeksNumarasi],
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          title: Text(
                            "eren",
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(100)),
                padding: EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    InkWell(
                      child: SizedBox(
                        height: 40,
                        width: 40,
                        child: Image.asset(
                          "ikonlar/happy.png",
                          scale: 25,
                        ),
                      ),
                      onTap: () {},
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Flexible(
                      child: TextField(
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          hintText: "Mesaj Gönder...",
                        ),
                        controller: mesaj,
                        autocorrect: true,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => mesajGonder(mesaj.text),
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: Image.asset(
                          "ikonlar/paper-plane.png",
                          scale: 25,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Grup2 extends StatefulWidget {
  var grupIsmi;
  Grup2({required this.grupIsmi});

  @override
  _Grup2State createState() => _Grup2State();
}

class _Grup2State extends State<Grup2> {
  @override
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
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.grupIsmi,
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            icon: Image.asset("assets/mesajlasma_icons/angle-left.png", width: 17, height: 17),
            onPressed: () => Navigator.pop(context),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.white,
        body: Padding(
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
                  itemBuilder: (context, int indeksNumarasi) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.teal[200],
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: ListTile(
                          subtitle: Text(
                            mesajlar[indeksNumarasi],
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          title: Text(
                            "eren",
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(100)),
                padding: EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    InkWell(
                      child: SizedBox(
                        height: 40,
                        width: 40,
                        child: Image.asset(
                          "ikonlar/happy.png",
                          scale: 25,
                        ),
                      ),
                      onTap: () {},
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Flexible(
                      child: TextField(
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          hintText: "Mesaj Gönder...",
                        ),
                        controller: mesaj,
                        autocorrect: true,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => mesajGonder(mesaj.text),
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: Image.asset(
                          "ikonlar/paper-plane.png",
                          scale: 25,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
