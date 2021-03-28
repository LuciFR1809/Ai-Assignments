import 'package:flutter/material.dart';
import "chat.dart";
import 'package:url_launcher/url_launcher.dart';

class Credits extends StatefulWidget {
  @override
  _CreditsState createState() => _CreditsState();
}
class _CreditsState extends State<Credits> {

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
        title: new Text('Credits'),
      ),
      body:Center(child:SafeArea(

        child:SizedBox(
          width:350,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('CS F407\nARTIFICIAL INTELLIGENCE\ncourse mandated project',textAlign: TextAlign.center,style:TextStyle(decoration: TextDecoration.underline,fontSize: 25,fontWeight: FontWeight.bold),),
              SizedBox(height: 30),
                Text('Abhishek Bapna\n2018A7PS0184H',textAlign: TextAlign.center,style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold,),),
              SizedBox(height: 10),
                Text('Anirudh Sood\n2018A7PS0673H',textAlign: TextAlign.center,style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
              SizedBox(height: 10),
                Text('Kumar Pranjal\n2018A7PS0163H',textAlign: TextAlign.center,style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
              SizedBox(height: 10),
              Text('We would firstly like to thank our Course instructor Prof. Chittaranjan Hota for giving us the opportunity to explore this facet of Artificial Intelligence. His input and guidance has been invaluable to our project and we would also like to thank the course TA\'s as well for resolving our doubts and providing constant inputs' ,textAlign: TextAlign.center,style:TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),

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


















