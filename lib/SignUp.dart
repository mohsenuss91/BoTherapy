

import 'package:botherapy/ChatRoom.dart';
import 'package:botherapy/SplashScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class SignUp extends StatelessWidget {
  final Map<String,dynamic> signUpData={'mail':null,'password':null,'name':null};
  final _formKey=new GlobalKey<FormState>();
  final focusMail=new FocusNode();
  final focusPassword=new FocusNode();
  final focusName=new FocusNode();
  final FirebaseAuth auth=FirebaseAuth.instance;
  void validateAndSave() {
    final form = _formKey.currentState;
    print(signUpData['mail']);
       form.save();
  }


  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        color: Color.fromRGBO(240,169,149,1).withOpacity(1),
        child: CustomPaint(
          painter: BgPainter(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0,16.0,0,0),
                child: Align(
                  child: IconButton(
                    icon:Icon(Icons.arrow_back),
                    iconSize: 30,
                    color: Colors.white.withOpacity(0.8),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                  alignment: Alignment.topLeft,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80  ),
                child: Container(
                    height: MediaQuery.of(context).size.height*0.15,
                    child: Image.asset('assets/logo.png',)),
              ),
              Text("Create your account",textAlign: TextAlign.center,style: TextStyle(fontFamily: 'Sakkal',fontSize: 25,color: Color(0xff707070),shadows: <Shadow>[
                Shadow(
                    offset: Offset(5.0, 6.0),
                    blurRadius: 10.0,
                    color: Colors.black.withOpacity(0.15)
                )
              ]),),
              SizedBox(height: 30,),
              Form(
                key: _formKey,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(80, 0, 80, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Flexible(
                              child: new TextFormField(keyboardType: TextInputType.text,
                                style: TextStyle(fontFamily: 'Sakkal',fontSize: 18,color: Color(0xff707070)),
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (v){
                                  FocusScope.of(context).requestFocus(focusPassword);
                                },
                                onChanged: (String value){
                                  signUpData['mail']=value.toString().trim();
                                },
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black)
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  hintStyle: TextStyle(fontFamily: 'Sakkal',fontSize: 18,color: Color(0xff707070)),
                                  hintText: 'Email',
                                  prefixIcon: Icon(Icons.phone,color: Colors.black,),
                                ),
                                validator: (String value){
                                  if(value.trim().isEmpty)
                                  {
                                    return'Email is required';
                                  }else{
                                    return"";
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Flexible(
                              child: new TextFormField(obscureText: true,
                                focusNode: focusPassword,
                                style: TextStyle(fontFamily: 'Sakkal',fontSize: 18,color: Color(0xff707070)),
                                onFieldSubmitted: (v){
                                  if(_formKey.currentState.validate())
                                  {
                                    _formKey.currentState.save();
                                  }
                                },
                                onChanged: (String value){
                                  signUpData['password']=value.toString().trim();
                                },
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Color.fromRGBO(0,0,0,1))
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Color.fromRGBO(0,0,0,1))
                                  ),
                                  hintText: 'Mot de Passe',
                                  hintStyle: TextStyle(fontFamily: 'Sakkal',fontSize: 18,color: Color(0xff707070)),
                                  prefixIcon: Icon(Icons.lock,color: Colors.black,),
                                ),
                                validator: (String value){
                                  if(value.trim().isEmpty)
                                  {
                                    return 'Password is required';
                                  }
                                  else{
                                    return "";
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Flexible(
                              child: new TextFormField(obscureText: true,
                                focusNode: focusName,
                                style: TextStyle(fontFamily: 'Sakkal',fontSize: 18,color: Color(0xff707070)),
                                onFieldSubmitted: (v){
                                  if(_formKey.currentState.validate())
                                  {
                                    _formKey.currentState.save();
                                  }
                                },
                                onSaved: (String value){
                                  signUpData['name']=value;
                                },
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Color.fromRGBO(0,0,0,1))
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Color.fromRGBO(0,0,0,1))
                                  ),
                                  hintText: 'Name',
                                  hintStyle: TextStyle(fontFamily: 'Sakkal',fontSize: 18,color: Color(0xff707070)),
                                  prefixIcon: Icon(Icons.lock,color: Colors.black,),
                                ),
                                validator: (String value){
                                  if(value.trim().isEmpty)
                                  {
                                    return 'Name is required';
                                  }
                                  else{
                                    return "";
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.12,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text('By continuing , you agree that you are at least 18 years of age',textAlign: TextAlign.center,style: TextStyle(fontFamily: 'Sakkal',fontWeight: FontWeight.normal,fontSize: 20,color: Color(0xff707070))),
              ),
              FlatButton(
                child: Text('Sign Up',style: TextStyle(fontFamily: 'Sakkal',fontWeight: FontWeight.bold,fontSize: 24,color: Colors.white)),
                onPressed: (){
                  validateAndSave();
                  auth.createUserWithEmailAndPassword(email: signUpData['mail'], password: signUpData['password']).then((result){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatRoom(userId: result.user.uid,)));
                  }).catchError((e){
                    print(e);
                  });
                },
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                color: Color.fromRGBO(240,149,149,1),
              )
            ],
          ),
        ),
      ),
    );
  }
}
