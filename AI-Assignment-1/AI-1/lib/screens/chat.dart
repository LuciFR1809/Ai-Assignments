import 'package:flutter/material.dart';
import "homePage.dart";
import "settings.dart";
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import'../models/chatMessageModel.dart';
class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}
class _ChatState extends State<Chat> {
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  int _selectedIndex = 1;
  List<ChatMessage> messages = [
    ChatMessage(messageContent: "who are you", messageType: "sender"),
    ChatMessage(messageContent: "I am S.A.R.A. (Salient Alzheimers Responsive Assistant) and I am here to help you in any way I can. I am specifically constructed to help you in any way I can.", messageType: "receiver"),
    ChatMessage(messageContent: "Altough I am still under development I want to so my best to help you :)Sara", messageType: "receiver"),
    ChatMessage(messageContent: "Hi, Who Am I?", messageType: "prompt"),
    ChatMessage(messageContent: "Your name is Ramesh Sharma, You suffer from 3rd grade Alzheimers but fear not I am with you :)", messageType: "receiver"),
    ChatMessage(messageContent: "Would you like to know more", messageType: "receiver"),
    ChatMessage(messageContent: "Yes please", messageType: "sender"),
    ChatMessage(messageContent: "You are an engineer by profession with a loving family always supporting you.You have been suffering from alzheimers for the past 5 years but you have been improving continuously.", messageType: "receiver"),
    ChatMessage(messageContent: "Your primary caretakers are Abhishek Bapna(Son), Anirudh Sood(Friend), Pranjal Kumar(Asst.)If you want to know more about yourself type in personal details", messageType: "receiver"),
    ChatMessage(messageContent: "what are my personal details", messageType: "prompt"),
    ChatMessage(messageContent: "Name:Ramesh Singhal,,Age:53,,Address:GT318 BITS Hyderabad,Thumkunta Hyderabad,,Home No.:79971442222,,Blood Group:O+,,Primary Caretaker:Abhishek Bapna", messageType: "receiver"),
    ChatMessage(messageContent: "where am I", messageType: "prompt"),
    ChatMessage(messageContent: "Would you like to go home", messageType: "receiver"),
    ChatMessage(messageContent: "yes", messageType: "prompt"),
    ChatMessage(messageContent: "You live at GT318, BITS Hyderabad ,Thumkunta...click on the link below to see your path you can call a cab from there as well", messageType: "receiver"),
    ChatMessage(messageContent: "caretakers", messageType: "sender"),
    ChatMessage(messageContent: "you have 3 registered caretakers Abhishek Bapna, Anirudh Sood, Kumar Pranjal who would you like to know about", messageType: "receiver"),
    ChatMessage(messageContent: "tell me about abhishek", messageType: "sender"),
    ChatMessage(messageContent: "Abhishek is your son who studies AI at BITS Hyderabad and is one of my creators(more info is present on the call page)", messageType: "receiver"),
    ChatMessage(messageContent: "Help Me", messageType: "sender"),
    ChatMessage(messageContent: "Are you in danger Ramesh?", messageType: "receiver"),
    ChatMessage(messageContent: "yes", messageType: "sender"),
    ChatMessage(messageContent: "OK do not worry call the SOS number right away and alert your caretakers", messageType: "receiver"),
  ];
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
          Navigator.push(context, MaterialPageRoute(builder: (context) => settings()));
        }
        break;

      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        flexibleSpace: SafeArea(
            child:Expanded(
              child:Column(
              children: <Widget>[
                SizedBox(width: 15,height:20,),
                CircleAvatar(
                  backgroundImage: AssetImage('images/sada.jpeg'),
                  radius: 50.0,
                ),
                Text("S.a.r.a",style: TextStyle( fontSize: 24 ,fontWeight: FontWeight.w600),),
              ],
            ),
            ),
        ),
      ),

      body: Column(
        children: <Widget>[
        Container(height: 100,decoration: BoxDecoration(
          color: Colors.lightBlue,
        ),),
      Expanded(child:
          ListView.builder(
            itemCount: messages.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 10,bottom: 10),
            physics: ClampingScrollPhysics(),
            itemBuilder: (context, index){
              return Container(
                padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                child: Align(
                  alignment: (messages[index].messageType == "receiver"?Alignment.topLeft:Alignment.topRight),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: (messages[index].messageType  == "receiver"?Colors.grey.shade200:Colors.blue[200]),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Text(messages[index].messageContent, style: TextStyle(fontSize: 15),),
                  ),
                ),
              );
            },
          ),
      ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10,bottom: 10,top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: (){ChatMessage(messageContent:"my" , messageType: "sender");
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(Icons.add, color: Colors.white, size: 20, ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  Expanded(
                    child: TextField(
                      controller: myController,
                      decoration: InputDecoration(
                          hintText: "Write message...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none
                      ),
                    ),
                  ),
                  SizedBox(width: 15,),
                  FloatingActionButton(
                    onPressed: (){

                    },
                    child: Icon(Icons.send,color: Colors.white,size: 18,),
                    backgroundColor: Colors.blue,
                    elevation: 0,
                  ),
                ],

              ),
            ),
          ),
        ],
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