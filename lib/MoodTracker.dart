import 'package:botherapy/SplashScreen.dart';
import 'package:flutter/material.dart';

class MoodTracker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE9D8D8),
      body: CustomPaint(
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
            SizedBox(height: MediaQuery.of(context).size.height*0.1,),
            Text('Your Mood Over Time',style: TextStyle(fontFamily: 'Sakkal',fontSize: 28,fontWeight: FontWeight.w400,color: Color(0xff707070),shadows: <Shadow>[
              Shadow(
                  offset: Offset(5.0, 6.0),
                  blurRadius: 6.0,
                  color: Colors.black.withOpacity(0.15)
              )
            ]),),
            Container(
              child: Image.asset('assets/mood.png'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text('Last Update : 2h ago',style: TextStyle(fontFamily: 'Sakkal',fontSize: 18,fontWeight: FontWeight.w100,color: Color(0xff707070),shadows: <Shadow>[
                    Shadow(
                        offset: Offset(5.0, 6.0),
                        blurRadius: 6.0,
                        color: Colors.black.withOpacity(0.15)
                    )
                  ]),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
