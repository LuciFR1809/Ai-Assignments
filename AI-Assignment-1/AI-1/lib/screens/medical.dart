import 'package:flutter/material.dart';
import "chat.dart";
import 'package:url_launcher/url_launcher.dart';

class Medical extends StatefulWidget {
  @override
  _MedicalState createState() => _MedicalState();
}
class _MedicalState extends State<Medical> {

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  int _selectedIndex = 1;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch(index) {
        case 0: {
          _makePhoneCall('tel:7869283747');
        }
        break;

        case 1: {
          Navigator.pop(context);
        }
        break;
        case 2: {

        }
        break;

      }
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Medical Certificates'),
      ),
      body:Center(
        child:SafeArea(
          child:GridView.count(
            crossAxisCount: 2,
            padding: EdgeInsets.all(4.0),
            children: <Widget>[
              InkWell(
                child: Card(
                color: Colors.blue.shade200,
                    child: new Center(
                      child: new Text('Certificate#1',style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                    )
        ),
              onTap: () {_makePhoneCall('https://drive.google.com/file/d/14dVojWkWtiMI3F5ABMvKSFLTvIW1GC3z/view');},
        ),
              InkWell(
                child: Card(
                    color: Colors.blue.shade200,
                    child: new Center(
                      child: new Text('Certificate#2',style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                    )
                ),
                onTap: () {_makePhoneCall('https://drive.google.com/file/d/14dVojWkWtiMI3F5ABMvKSFLTvIW1GC3z/view');},
              ),
              InkWell(
                child: Card(
                    color: Colors.blue.shade200,
                    child: new Center(
                      child: new Text('Certificate#3',style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                    )
                ),
                onTap: () {_makePhoneCall('https://drive.google.com/file/d/14dVojWkWtiMI3F5ABMvKSFLTvIW1GC3z/view');},
              ),
              InkWell(
                child: Card(
                    color: Colors.blue.shade200,
                    child: new Center(
                      child: new Text('Certificate#4',style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                    )
                ),
                onTap: () {_makePhoneCall('https://drive.google.com/file/d/14dVojWkWtiMI3F5ABMvKSFLTvIW1GC3z/view');},
              ),
            ],
          )
      ),
      ),
      bottomNavigationBar: BottomNavigationBar(
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.grey.shade600,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.ring_volume),
          title: Text("SOS"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text("Home"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          title: Text("Settings"),
        ),

      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    ),
    );
  }
}


















