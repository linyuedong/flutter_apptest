import 'package:flutter/material.dart';
import 'Utils/LogUtils.dart';
import 'widget/HomePageElement.dart';
import 'widget/HttpPage.dart';
import 'widget/ImageElement.dart';
import 'widget/ScaffoldWidget.dart';
import 'widget/SplashElement.dart';
import 'widget/pageviewindicator/MyPageViewIndicator.dart';
import 'widget/pageviewindicator/SwipeElement.dart';
import 'widget/tabbar/TabBarBottomPageWidget.dart';
import 'widget/tabbar/TabBarPageWidget.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('print------');
    debugPrint('debugPrint-----');
    LogUtils.v('yancy', 'v-------');
    LogUtils.d('yancy', 'd-------');
    LogUtils.i('yancy', 'i-------');
    LogUtils.w('yancy', 'w-------');
    LogUtils.e('yancy', 'e-------');

    return new MaterialApp(
        title: 'Flutter Demo',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new MainPage());
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Title"),
      ),
      body: new Column(
        children: <Widget>[
          new FlatButton(
              color: Colors.blue,
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(builder: (context) => new TabBarPageWidget()));
              },
              child: new Text("Top Tab")),
          new FlatButton(
              color: Colors.blue,
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(builder: (context) => new TabBarBottomPageWidget()));
              },
              child: new Text("Bottom Tab")),
          new FlatButton(
              color: Colors.blue,
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder:(context) => new SwipeWidget()));
                },
               child: new Text("SwipeWidget"),
              ),
          new FlatButton(
              color: Colors.blue,
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(builder: (context) => new ScaffoldRoute()));
              },
              child: new Text(" Scaffold")),
          new FlatButton(
              color: Colors.blue,
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(builder: (context) => new ImageElement()));
              },
              child: new Text(" ImageElement")),
          new FlatButton(
              color: Colors.blue,
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(builder: (context) => new SplashElement()));
              },
              child: new Text("SplashElement")),
          new FlatButton(
              color: Colors.blue,
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(builder: (context) => new HomePage()));
              },
              child: new Text("HomePage")),
          new FlatButton(
              color: Colors.blue,
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(builder: (context) => new HtttPage()));
              },
              child: new Text("HttpTest")),
        ],
      ),
    );
  }
}
