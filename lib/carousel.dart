import 'package:botherapy/SplashScreen.dart';
import 'package:botherapy/homepage.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';

final List<String> imgList = [
  'assets/Card1.png',
  'assets/Card2.png',
  'assets/Card3.png',
  'assets/Card4.png',
  'assets/Card5.png',
];

class CarouselPage extends StatefulWidget {
  @override
  _CarouselPageState createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {
  int _current=0;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return Container(
        color: Color.fromRGBO(240,149,149,0.5),
        child: CustomPaint(
        painter: BgPainter(),
        child: Center(
          child:Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CarouselSlider(
                  options: CarouselOptions(
                      height: 420.0,
                    aspectRatio: 16/2,
                    viewportFraction: 0.7,
                    reverse: false,
                    enableInfiniteScroll: false,
                    onPageChanged: (index,reason){
                        setState(() {
                          _current=index;
                        });
                    }
                  ),
                  items: imgList.map((item) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(240,149,149,0.5),
                              borderRadius: BorderRadius.all(Radius.circular(40))
                            ),
                            child: Image.asset(item)
                        );
                      },

                    );
                  }).toList(),

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imgList.map((url){
                    int index=imgList.indexOf(url);
                    return Container(
                      width: 15.0,
                      height: 15.0,
                      margin: EdgeInsets.symmetric(vertical: 20.0,horizontal:10.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current==index
                          ? Color.fromRGBO(240,149,149,1)
                            : Color.fromRGBO(240,149,149,0.5),
                      ),
                    );
                  }).toList(),
                ),
                Container(
                  child: _current==4?
                  FlatButton(
                      child: Text('Get Started',style: TextStyle(fontFamily: 'Sakkal',fontWeight: FontWeight.bold,fontSize: 24,color: Colors.white)),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                      },
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                      color: Color.fromRGBO(240,149,149,1)
                  ):null
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}
