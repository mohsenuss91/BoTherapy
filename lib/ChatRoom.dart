import 'dart:async';

import 'package:botherapy/BOTMESSAGES.dart';
import 'package:botherapy/MoodTracker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final FirebaseDatabase _database = FirebaseDatabase.instance;
final DatabaseReference _messageDatabaseReference=FirebaseDatabase.instance.reference().child("messages");
const _name="Benantar Abdennour";

class ChatRoom extends StatelessWidget{
  ChatRoom({Key key,  this.userId})
      : super(key: key);

  final String userId;
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Chat Room",
      home: new ChatScreen(),
    );
  }
}
class ChatScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=>new ChatScreenState();
}
class ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin{
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController=new TextEditingController();
  int i=0;
  bool _isComposing =false;
  Widget _buildTextComposer(){
    return IconTheme(
      data: new IconThemeData(color: Color.fromRGBO(240,149,149,1)),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 18.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                onChanged: (String text){
                  setState(() {
                    _isComposing=true;
                  });
                },
                decoration: new InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            new Container(
                margin: new EdgeInsets.symmetric(horizontal: 2.0),
                child: new IconButton(
                    icon: new Icon(Icons.send),
                    onPressed: _isComposing ?
                        () => _handleSubmitted(_textController.text) : null
                )
            ),
          ],
        ),
      ),
    );
  }
  void _handleSubmitted(String text){
    _textController.clear();
    setState(() {
      _isComposing=false;
    });
    final ChatMessage message = _createMessageFromText(text,false);
    _messageDatabaseReference.push().set(message.toMap());

    setState(() {
      _messages.insert(0, message);
    });
    message.animationController.forward();
    final ChatMessage botmessage = _createMessageFromText(botmessages[i],true);
    _messageDatabaseReference.push().set(message.toMap());

    setState(() {
      _messages.insert(0, botmessage);
      i++;
    });
    Timer(Duration(seconds: 2),(){
      botmessage.animationController.forward();
    });
  }
  ChatMessage _createMessageFromText(String text,bool bot) => ChatMessage(
    text: text,
    username: _name,
    botMsg: bot,
    animationController: new AnimationController(
      vsync: this,
      duration: new Duration(milliseconds: 700),
    ),
  );

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return new Scaffold(
        backgroundColor: Color(0xffE9D8D8),
        body:
        Container(
          decoration: Theme.of(context).platform ==TargetPlatform.iOS
              ? new BoxDecoration(
              border: new Border(
                top: new BorderSide(color: Colors.grey[200]),
              )
          ) : null ,
          child: new Column(
            children: <Widget>[
              new Container(
                decoration: new BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: _buildNavBar(),
              ),
              new Flexible(
                child:new ListView.builder(
                  itemBuilder:(_,int index)=>_messages[index],
                  itemCount: _messages.length,
                  padding: new EdgeInsets.all(8.0),
                  reverse: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:20.0,vertical: 5),
                child: new Container(
                  decoration: new BoxDecoration(
                      color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: _buildTextComposer(),
                ),
              ),
            ],
          ),
        )
    );
  }
  @override
  void dispose() {
    for(ChatMessage message in _messages){
      message.animationController.dispose();
    }
    super.dispose();
  }
  Widget _buildNavBar(){
    return IconTheme(
      data: new IconThemeData(color: Color.fromRGBO(240,149,149,1)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: new Container(
          margin: const EdgeInsets.symmetric(horizontal: 18.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
                child: Image.asset('assets/writings.png',),
                onTap: (){},
              ),
              Container(
                  height: 30,
                  child: Image.asset('assets/logo.png',)),
              InkWell(
                child: Image.asset('assets/moodTracker.png',),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MoodTracker()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text, this.animationController, this.username,this.botMsg});
  final String username;
  final String text;
  final AnimationController animationController;
  final bool botMsg;
  @override
  Widget build(BuildContext context) {
    if(!botMsg){
    return new SizeTransition(                                    //new
        sizeFactor: new CurvedAnimation(                              //new
            parent: animationController, curve: Curves.easeOut),      //new
        axisAlignment: 0.0,                                           //new
        child: new Container(                                    //modified
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Expanded(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    new Container(
                      margin: const EdgeInsets.only(top: 5.0),
                      padding: EdgeInsets.all(20),
                      child: new Text(text),
                      width: MediaQuery.of(context).size.width*0.8,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )                                                           //new
    );
  }else{
      return new SizeTransition(                                    //new
          sizeFactor: new CurvedAnimation(                              //new
              parent: animationController, curve: Curves.easeOut),      //new
          axisAlignment: 0.0,                                           //new
          child: new Container(                                    //modified
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Expanded(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Container(
                        margin: const EdgeInsets.only(top: 5.0),
                        padding: EdgeInsets.all(20),
                        child: new Text(text,style: TextStyle(fontFamily: 'Tw Cen MT'),),
                        width: MediaQuery.of(context).size.width*0.8,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(240,149,149,1),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )                                                           //new
      );
    }
  }
  Map<String, dynamic> toMap(){
    return{
      'username': this.username,
      'text':this.text,
    };
  }


}

