import 'package:flutter/material.dart';
import 'package:flutter_app/Utils/Utils.dart';
import 'package:flutter_app/widget/ScaffoldWidget.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwipeWidget extends StatefulWidget {
  SwipeWidget({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<SwipeWidget> {
  List<Widget> _pages = null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  void init() {
    _pages = <Widget>[
      new ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: new FlutterLogo(colors: Colors.blue),
      ),
      new ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: new FlutterLogo(
            style: FlutterLogoStyle.stacked, colors: Colors.red),
      ),
      new Stack(
        children: <Widget>[
          new ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: new FlutterLogo(
                style: FlutterLogoStyle.horizontal, colors: Colors.green),
          ),
          new Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 160.0),
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new ScaffoldRoute()));
                },
                child: Text("马上体验"),
                color: Colors.green,
                textColor: Colors.white,
                splashColor: Colors.grey,
                padding: EdgeInsets.all(40),
                shape: CircleBorder(),
              ),
            ),
          )
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    Utils.ImmersionStatusBar();
    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text("SwipeWidget"),
//      ),
      body: new Swiper(
        // autoplay: true,
        //autoplayDelay: 10000,
        //scrollDirection: Axis.horizontal,
        loop: false,
        pagination: SwiperPagination(
            builder: DotSwiperPaginationBuilder(
                size: 5, //点点没选中时候的大小
                activeSize: 8, //点点选中后的大小
                color: Colors.grey, //点点的颜色
                activeColor: Colors.deepOrangeAccent),
            alignment: Alignment.bottomCenter),

        itemBuilder: (BuildContext context, int index) {
          return _pages[index];
        },
        itemCount: _pages.length,
      ),
    );
  }
}
