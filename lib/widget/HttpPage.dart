
import 'package:flutter/material.dart';
import 'package:flutter_app/Utils/Httputils.dart';

class HtttPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HtttPageState();
  }
  
}

class HtttPageState extends State<HtttPage>{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var httpGetTest = HttpUtils.HttpGetTest("https://www.wanandroid.com/banner/json");
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Text('aa');
  }
  
  
  
}