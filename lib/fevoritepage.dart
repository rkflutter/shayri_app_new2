import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share_plus/share_plus.dart';

class fevorite extends StatefulWidget {
  List temparray;
  fevorite(this.temparray);
  @override
  State<fevorite> createState() => _fevoriteState();
}

class _fevoriteState extends State<fevorite> {
  List temp2=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.deepPurple[800],
      appBar: AppBar(title:Text("Fevorite Shayri"),backgroundColor: Colors.deepPurple[800],centerTitle: true,),
      body: ListView.builder(itemCount: widget.temparray.length,itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(30)),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: Text(
                  widget.temparray[index],
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                margin: EdgeInsets.all(15),
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
                          FlutterClipboard.copy('${widget.temparray[index]}').then(( value ) => print('copied'));
                          Fluttertoast.showToast(
                              msg: "Copied",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.lightBlueAccent,
                              textColor: Colors.black,
                              fontSize: 16.0
                          );
                        }, icon: Icon(Icons.copy, size: 30)),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.play_circle, size: 30)),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            temp2.add(widget.temparray[index]);
                              widget.temparray.remove(widget.temparray[index]);
                          });
                        },
                        icon: Icon(Icons.favorite,
                            size: 30)),
                    IconButton(
                        onPressed: () {
                          Share.share(widget.temparray[index]);
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
        );
      },),
    );
  }
}
