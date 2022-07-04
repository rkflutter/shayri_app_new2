import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shayri_app2/fevoritepage.dart';
import 'package:shayri_app2/shayriclass.dart';

class second extends StatefulWidget {
  int index;
  List listtext;
  second(this.index, this.listtext);

  @override
  State<second> createState() => _secondState();
}
GlobalKey gb= GlobalKey();
class _secondState extends State<second> {
  Future<Uint8List> _capturePng() async {
    try {
      print('inside');
      RenderRepaintBoundary? boundary =
          gb.currentContext!.findRenderObject() as RenderRepaintBoundary?;
      ui.Image image = await boundary!.toImage(pixelRatio: 3.0);
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      var pngBytes = byteData!.buffer.asUint8List();
      var bs64 = base64Encode(pngBytes);
      print(pngBytes);
      print(bs64);
      setState(() {});
      return pngBytes;
    } catch (e) {
      print(e);

      return Future.value();
    }
  }
  List temp = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.index == 0) {
      temp = Shayrilist.shubh;
    }
    if (widget.index == 1) {
      temp = Shayrilist.dosti;
    }
    if (widget.index == 2) {
      temp = Shayrilist.maje;
    }
    if (widget.index == 3) {
      temp = Shayrilist.bhag;
    }
    if (widget.index == 4) {
      temp = Shayrilist.prerna;
    }
    if (widget.index == 5) {
      temp = Shayrilist.jivan;
    }
    if (widget.index == 6) {
      temp = Shayrilist.mohhbat;
    }
    if (widget.index == 7) {
      temp = Shayrilist.yade;
    }
    if (widget.index == 8) {
      temp = Shayrilist.hindi;
    }
    if (widget.index == 9) {
      temp = Shayrilist.rajniti;
    }
    if (widget.index == 10) {
      temp = Shayrilist.prem;
    }
    if (widget.index == 11) {
      temp = Shayrilist.dard;
    }
    if (widget.index == 12) {
      temp = Shayrilist.sharab;
    }
    if (widget.index == 13) {
      temp = Shayrilist.bevfa;
    }
    if (widget.index == 14) {
      temp = Shayrilist.janmdin;
    }
    if (widget.index == 15) {
      temp = Shayrilist.holi;
    }
    temparray;
    createFolder();
  }
  

  List temparray = [];

  createFolder() async {
    final folderName = "Shayrisecond";
    final path = Directory("storage/emulated/0/$folderName");
    if ((await path.exists())) {
      // TODO:
      print("exist");
    } else {
      // TODO:
      print("not exist");
      path.create();
    }
    setState(() {
      folderpath = path.path;
    });
  }

  String folderpath = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[800],
      appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return fevorite(temparray);
                    },
                  ));
                },
                icon: Icon(Icons.favorite))
          ],
          title: Text(widget.listtext[widget.index]),
          centerTitle: true,
          backgroundColor: Colors.deepPurple[800]),
      body: RefreshIndicator(onRefresh: () async {setState(() {
        temparray;
      });
      },
        child: ListView.builder(key: gb,
          itemCount: temp.length,
          itemBuilder: (context, index) {
            return Card(
              shadowColor: Colors.black,
              elevation: 5,
              margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(30)),
                child: Column(
                  children: [
                    RepaintBoundary(
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          temp[index],
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                        margin: EdgeInsets.all(15),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: Colors.deepPurpleAccent[100],
                          borderRadius:
                              BorderRadius.vertical(bottom: Radius.circular(30))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                              onPressed: () {
                                FlutterClipboard.copy('${temp[index]}')
                                    .then((value) => print('copied'));
                                Fluttertoast.showToast(
                                    msg: "Copied",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.lightBlueAccent,
                                    textColor: Colors.black,
                                    fontSize: 16.0);
                              },
                              icon: Icon(Icons.copy, size: 30)),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.play_circle, size: 30)),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  if (temparray.contains(temp[index])) {
                                    temparray.remove(temp[index]);
                                  } else
                                    temparray.add(temp[index]);
                                });
                              },
                              icon: Icon(
                                  temparray.contains(temp[index])
                                      ? Icons.favorite
                                      : Icons.favorite_border_outlined,
                                  size: 30)),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  Share.share(temp[index]);
                                });
                              },
                              icon: Icon(
                                Icons.share,
                                size: 30,
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
