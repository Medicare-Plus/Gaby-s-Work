import 'package:flutter/material.dart';

class QRBase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                title: Text('QR Code'),
                backgroundColor: Color(0xff234499),
                leading: IconButton(
                    icon: Icon(Icons.arrow_back, color: Color(0xff61c198)),
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/More');
                    })),
            body: SingleChildScrollView(
                //This allows to scrollz, this should be declared to larrge lists otherwise the rest of the list will not display and have errors
                child: Center(
                    child: Column(mainAxisSize: MainAxisSize.max, children: [
              Container(
                height: 25,
              ),
              Container(
                  height: 350,
                  child:
                      Icon(Icons.qr_code, color: Color(0xff61c198), size: 300)),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                SizedBox(
                  width: 100,
                  child: TextButton.icon(
                      icon: Icon(Icons.save, color: Color(0xff61c198)),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xff234499))),
                      label: Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {}),
                ),
                SizedBox(
                  width: 100,
                  child: TextButton.icon(
                      icon: Icon(Icons.share, color: Color(0xff61c198)),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xff234499))),
                      label: Text(
                        "share",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {}),
                ),
              ]),
            ])))));
  }
}
