import 'package:botherapy/carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: CustomPaint(
          painter: BgPainter(),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 120  ),
                child: Container(
                    height: MediaQuery.of(context).size.height*0.1,
                    child: Image.asset('assets/logo.png',)),
              ),
              Text('Botherapy',style: TextStyle(fontFamily: 'Sakkal',fontSize: 80,color: Color(0xff707070),shadows: <Shadow>[
                Shadow(
                    offset: Offset(5.0, 6.0),
                    blurRadius: 6.0,
                    color: Colors.black.withOpacity(0.15)
                )
              ]),),
              Text('Will Never Let You Down ',style: TextStyle(fontFamily: 'Sakkal',fontSize: 20,color: Color(0xff707070),shadows: <Shadow>[
                Shadow(
                    offset: Offset(5.0, 6.0),
                    blurRadius: 6.0,
                    color: Colors.black.withOpacity(0.15)
                )
              ]),),
              FlatButton(
                  child: Text('Let us Talk ',style: TextStyle(fontFamily: 'Sakkal',fontWeight: FontWeight.bold,fontSize: 24,color: Colors.white)),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CarouselPage()));
                  },
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                  color: Color.fromRGBO(240,149,149,1)
              ),
              Expanded(
                child: Container(
                  child:Image.asset('assets/brain.png',fit: BoxFit.fill,),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}

class BgPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();
    paint.color=Colors.white;
    var rect=Rect.fromLTWH(0.0, 0.0, size.width,size.height);
    canvas.drawRect(rect, paint);

    //bg paths
    //path1
    paint.color = Color.fromRGBO(240,149,149,1);
    var path=new Path();
    path.lineTo(0, size.height/2);
    path.cubicTo(size.width*0.1,size.height*0.16,size.width*0.2,size.height*0.2,size.width*0.2,size.height*0.2);
    path.cubicTo(size.width*0.25,size.height*0.22,size.width*0.3,size.height*0.2,size.width*0.35,size.height*0.15);
    path.lineTo(size.width*0.5, 0);
    path.close();
    canvas.drawPath(path, paint);

    //path2
    paint.color = Color.fromRGBO(240,149,149,1);
    var path2=new Path();
    path2.lineTo(size.width, 0);
    path2.lineTo(size.width, size.height/1.6);
    path2.cubicTo(size.width,size.height*0.16,size.width*0.8,size.height*0.2,size.width*0.85,size.height*0.1);
    path2.cubicTo(size.width*0.9,size.height*0.1,size.width*0.9,size.height*0.1,size.width*0.85,size.height*0.1);
    path2.lineTo(size.width*0.9, 0);
    path2.close();
    canvas.drawPath(path2, paint);

  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}