import 'package:botherapy/SignIn.dart';
import 'package:botherapy/SignUp.dart';
import 'package:botherapy/SplashScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return Scaffold(
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
              Text("PsyBot's main mission is to make you feel better .. everyday",textAlign: TextAlign.center,style: TextStyle(fontFamily: 'Sakkal',fontSize: 25,color: Color(0xff707070),shadows: <Shadow>[
                Shadow(
                    offset: Offset(5.0, 6.0),
                    blurRadius: 10.0,
                    color: Colors.black.withOpacity(0.15)
                )
              ]),),
              SizedBox(height: 30,),
              Text("We value your inner happiness",textAlign: TextAlign.center,style: TextStyle(fontFamily: 'Sakkal',fontSize: 18,color: Color(0xff707070),shadows: <Shadow>[
                Shadow(
                    offset: Offset(5.0, 6.0),
                    blurRadius: 10.0,
                    color: Colors.black.withOpacity(0.15)
                )
              ]),),
              SizedBox(height: MediaQuery.of(context).size.height*0.25,),
              FlatButton(
                  child: Text('Sign In',style: TextStyle(fontFamily: 'Sakkal',fontWeight: FontWeight.bold,fontSize: 24,color: Colors.white)),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));
                  },
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                  color: Color.fromRGBO(240,149,149,1)
              ),
              FlatButton(
                  child: Text('Sign Up',style: TextStyle(fontFamily: 'Sakkal',fontWeight: FontWeight.bold,fontSize: 24,color: Colors.white)),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
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
