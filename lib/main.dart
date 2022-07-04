import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shayri_app2/secondpage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: shayri(),
  ));
}

class shayri extends StatefulWidget {
  const shayri({Key? key}) : super(key: key);

  @override
  State<shayri> createState() => _shayriState();
}

class _shayriState extends State<shayri> {
  List listtext = [
    "शुभकामनाएं शायरी",
    "दोस्ती शायरी",
    "मजेदार शायरी ",
    "भगवान शायरी",
    "प्रेरणा स्त्रोत शायरी",
    "जीवन शायरी",
    "मोहब्बत शायरी",
    "यादें शायरी",
    "हिंदी शायरी",
    "राजनीति शायरी",
    "प्रेम शायरी",
    "दर्द शायरी",
    "शराब शायरी",
    "बेवफा शायरी",
    "जन्मदिन शायरी",
    "होली शायरी"
  ];
  @override
  void initState() {
    super.initState();
    forpermiission();
  }
  forpermiission()
  async {
    var status = await Permission.storage.status;
    if (status.isDenied) {

      await [
        Permission.storage,
      ].request();
      // We didn't ask for permission yet or the permission has been denied before but not permanently.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[800],
      appBar: AppBar(
        title: Text("All Shayri"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple[800],
      ),
      body: ListView.builder(
        itemCount: listtext.length,
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return second(index, listtext);
                  },
                ));
              },
              child: Card(elevation: 5,shadowColor: Colors.black26,
                color: Colors.deepPurple[800],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                  tileColor: Colors.purple,
                  title: Text(
                    listtext[index],
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
