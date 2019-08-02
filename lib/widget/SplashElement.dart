
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/Utils/TimerUtils.dart';

import 'ScaffoldWidget.dart';

class SplashElement extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //沉浸式状态栏
    if (Platform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle =
      SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
      return SplashPageWidget();

  }

}

class SplashPageWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SplashPageState();
  }

}

class SplashPageState extends State<SplashPageWidget>{

  int _totalCount = 3;

  @override
  void initState() {
    super.initState();
    startCountDown();
  }

  void startCountDown() {
    var timerUtil = new TimerUtil(mTotalTime: _totalCount*1000);
    timerUtil.setOnTimerTickCallback((int tick){
      double time = tick/1000;
      setState(() {
          _totalCount = time.toInt();
          if(_totalCount == 0){
            Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => new ScaffoldRoute()));
          }

      });
    });
    timerUtil.startCountDown();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  new Stack(
      children: <Widget>[
        new ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: new Image.asset(
            "assets/images/3.0x/splash_bg.png",
            fit: BoxFit.fill,
          ),
        ),
        new Container(
            alignment: Alignment.topRight,
            margin: EdgeInsets.all(30.0,),

            child: new Container(
              width: 70,
              height: 40,
              decoration: BoxDecoration(
                color: Color(0x66000000),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                border: Border.all(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
              child: new FlatButton(
                  onPressed: () {
                     Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => new ScaffoldRoute()));},
                  child: Text("跳过"+'$_totalCount',
                    style: new TextStyle(fontSize: 14.0, color: Colors.white),)),
            )

        ),

      ],
    );;
  }



}