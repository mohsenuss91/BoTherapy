import 'package:botherapy/SplashScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  final Map<String,dynamic> signInData={'mail':null,'password':null};
  final _formKey=new GlobalKey<FormState>();
  final focusMail=new FocusNode();
  final focusPassword=new FocusNode();
  @override
  Widget build(BuildContext context) {

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
              Text("Sign in to your account",textAlign: TextAlign.center,style: TextStyle(fontFamily: 'Sakkal',fontSize: 25,color: Color(0xff707070),shadows: <Shadow>[
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
                                onSaved: (String value){
                                  signInData['mail']=value;
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
                                onSaved: (String value){
                                  signInData['password']=value;
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
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.25,),
              InkWell(
                child: Text('Forgot your Password ?',style: TextStyle(fontFamily: 'Sakkal',fontWeight: FontWeight.normal,fontSize: 24,color: Color(0xff707070))),
                onTap: (){

                },
              ),
              FlatButton(
                child: Text('Sign In',style: TextStyle(fontFamily: 'Sakkal',fontWeight: FontWeight.bold,fontSize: 24,color: Colors.white)),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));
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
