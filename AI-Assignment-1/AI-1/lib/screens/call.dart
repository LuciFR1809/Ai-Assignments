import 'package:flutter/material.dart';
import "chat.dart";
import 'package:url_launcher/url_launcher.dart';

class Call extends StatefulWidget {
  @override
  _CallState createState() => _CallState();
}
class _CallState extends State<Call> {

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
        title: new Text('Caretakers'),
      ),
      body:Center(
        child:SafeArea(

        child:SizedBox(
          width:350,
        child: ListView(
        children: <Widget>[
          SizedBox(height: 10),
          SizedBox(
            height:70,
            child:ElevatedButton(
              child:Row( children: <Widget>[
                new Expanded (
                  flex:8,
                  child : Column(mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[Text(''), Text('  Ambulance',style:TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),],),),
                new Expanded (
                  flex:2,
                  child : Icon(Icons.phone, size: 40.0),
                ),

              ],
              ),
              onPressed: () {_makePhoneCall('tel:108');},
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            height:70,
            child:ElevatedButton(
              child:Row( children: <Widget>[
                new Expanded (
                  flex:8,
                  child : Column(mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[Text(''), Text('  Police',style:TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),],),),
                new Expanded (
                  flex:2,
                  child : Icon(Icons.phone, size: 40.0),
                ),

              ],
              ),
              onPressed: () {_makePhoneCall('tel:100');},
            ),
          ),

          SizedBox(height: 10),
          SizedBox(
        height:160,
        child:ElevatedButton(

          child:Row( children: <Widget>[
        new Expanded (
        flex:3,
          child : CircleAvatar(
          backgroundImage: AssetImage('images/abhishek.JPG'),
          radius: 45.0,
        ),
        ),
          new Expanded (
            flex:7,
            child : Column(mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(''),
                Text('  Abhishek Bapna \n (Brother)',style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                Text('  Primary Caretaker',style:TextStyle(fontSize: 19,fontWeight: FontWeight.w900),),
                Text('  27/1002 NRI Complex,\n  Nerul, Navi Mumbai',style:TextStyle(fontSize: 17,fontWeight: FontWeight.w500),),
                Text('  +91-9967644222',style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              ],

            ),),
          new Expanded (
            flex:2,

            child : Icon(Icons.phone, size: 40.0),
            ),

          ],
        ),
    onPressed: () {_makePhoneCall('tel:9967644222');},
    ),
    ),
          SizedBox(height: 10),
          SizedBox(
            height:160,
            child:ElevatedButton(

              child:Row( children: <Widget>[
                new Expanded (
                  flex:3,
                  child : CircleAvatar(
                    backgroundImage: AssetImage('images/pranjal.jpg'),
                    radius: 45.0,
                  ),
                ),
                new Expanded (
                  flex:7,
                  child : Column(mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(''),
                      Text('  Kumar Pranjal \n (Friend)',style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                      Text('  Secondary Caretaker',style:TextStyle(fontSize: 18,fontWeight: FontWeight.w900),),
                      Text('  Nalanda, Bihar',style:TextStyle(fontSize: 17,fontWeight: FontWeight.w500),),
                      Text('  +91-8864081249',style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    ],

                  ),),
                new Expanded (
                  flex:2,

                  child : Icon(Icons.phone, size: 40.0),
                ),

              ],
              ),
              onPressed: () {_makePhoneCall('tel:8864081249');},
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            height:160,
            child:ElevatedButton(

              child:Row( children: <Widget>[
                new Expanded (
                  flex:3,
                  child : CircleAvatar(
                    backgroundImage: AssetImage('images/sood.jpg'),
                    radius: 45.0,
                  ),
                ),
                new Expanded (
                  flex:7,
                  child : Column(mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(''),
                      Text('  Anirudh Sood\n(Asst.)',style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                      Text('  Secondary Caretaker',style:TextStyle(fontSize: 18,fontWeight: FontWeight.w900),),
                      Text('  Chandigarh, Punjab',style:TextStyle(fontSize: 17,fontWeight: FontWeight.w500),),
                      Text('  +91-9988819740',style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    ],

                  ),),
                new Expanded (
                  flex:2,

                  child : Icon(Icons.phone, size: 40.0),
                ),

              ],
              ),
              onPressed: () {_makePhoneCall('tel:9988819740');},
            ),
          ),
          SizedBox(height: 10),

        ],
      ),
      ),

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


















