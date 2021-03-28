import 'package:flutter/material.dart';
import "settings.dart";
import "chat.dart";
import "call.dart";
import "medical.dart";
import "credits.dart";
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'package:flutter_screen_lock/configurations/input_button_config.dart';
import 'package:flutter_screen_lock/configurations/screen_lock_config.dart';
import 'package:flutter_screen_lock/configurations/secret_config.dart';
import 'package:flutter_screen_lock/configurations/secrets_config.dart';
import 'package:flutter_screen_lock/functions.dart';
import 'package:flutter_screen_lock/screen_lock.dart';

const _url= 'https://www.google.com/maps/dir//Birla+Institute+of+Technology+%26+Science+Pilani,+Hyderabad+Campus,+BITS+Pilani+Hyderabad+Campus,+Secunderabad,+Telangana+500078/@17.5448939,78.5696493,17z/data=!4m8!4m7!1m0!1m5!1m1!1s0x3bcb83594a86132d:0xc3e06e9e76cebf3d!2m2!1d78.571838!2d17.5448888';

class HomePage1 extends StatefulWidget {
  @override
  _HomePage1State createState() => _HomePage1State();
}
class _HomePage1State extends State<HomePage1> {
  void _launchURL() async => await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';

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
        case 2: {

          Navigator.push(context, MaterialPageRoute(builder: (context) => settings()));
        }
        break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
return SafeArea(
    child: Scaffold(
      body:SingleChildScrollView( child:Center(
        child:SizedBox(
          width: 350,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[
            SizedBox(height: 50),
              SizedBox(
              child:Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('images/sada.jpeg'),
                  radius: 50.0,
                ),
          Text('S.a.r.a',style: GoogleFonts.caveat(
            fontSize: 40,),),
        ],
        ),
        ),
            SizedBox(height: 20),
        SizedBox(
            height:70,
            child:ElevatedButton(
              child:Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[ Text('PRESS ME!   ',style:TextStyle(fontSize: 25,fontWeight: FontWeight.bold),), Icon(Icons.chat),],),
                onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Chat()));},
            ),
            ),
            SizedBox(height: 20),
          SizedBox(
            height:70,
            child:ElevatedButton(
              child:Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[ Text('Go Home   ',style:TextStyle(fontSize: 25,fontWeight: FontWeight.bold),), Icon(Icons.room),],),
              onPressed: _launchURL,
            ),
          ),
            SizedBox(height: 20),
          SizedBox(
            height:70,
            child:ElevatedButton(
              child:Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[ Text('Call Caretakers   ',style:TextStyle(fontSize: 25,fontWeight: FontWeight.bold),), Icon(Icons.call),],),
              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Call()));},
            ),
          ),
            SizedBox(height: 20),
          SizedBox(
            height:70,
            child:ElevatedButton(
              child:Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[ Text('Medical Certificates   ',style:TextStyle(fontSize: 25,fontWeight: FontWeight.bold),), Icon(Icons.assignment),],),
              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Medical()));},
            ),
          ),
            SizedBox(height: 40),
            SizedBox(
              height:70,
              child:Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    child:Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[ Icon(Icons.language),Text('Browser',style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold),), ],),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                    ),
                    onPressed: () {_makePhoneCall('https://www.google.com');},
                  ),
                  ElevatedButton(
                    child:Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[ Icon(Icons.amp_stories_outlined),Text(' Credits ',style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold),), ],),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                    ),
                    onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Credits()));},
                  ),
                  ElevatedButton(
                    child:Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[ Icon(Icons.call),Text('  Dialer  ',style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold),), ],),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                    ),
                    onPressed: () {_makePhoneCall('tel:+91');},
                  ),

              ],
              ),
              ),
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
    ),
);
  }
}