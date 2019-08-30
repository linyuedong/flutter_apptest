import 'package:flutter/material.dart';
import 'package:flutter_app/models/ArticleModel.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

import 'WebViewWidget.dart';

class CardWidget extends StatefulWidget {
  final ArticleModelDataData articleItem;

  const CardWidget({Key key, this.articleItem}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CardState();
  }
}

class _CardState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      //height: 140,
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 6),
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => WebViewWidget(
                  url: widget.articleItem.link,
                  title: widget.articleItem.title,
                ))),
        child: Card(
         // color: Colors.blueAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          //对Widget截取的行为，比如这里 Clip.antiAlias 指抗锯齿
          clipBehavior: Clip.antiAlias,
          semanticContainer: false,
          child: getChild(),
        ),
      ),
    );
  }

  getChild() {
    return Container(
      margin: EdgeInsets.all(12),
      child: new Column(
        children: <Widget>[
          new Row(
            // mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              new Icon(Icons.person,
                color: Colors.blueAccent),
              new Text(widget.articleItem.author),
              new Expanded(
                flex: 1,
                child: new Align(
                  alignment: Alignment.centerRight,
                  child: new Text(widget.articleItem.chapterName + "/"+ widget.articleItem.superChapterName),
                )
              ),
            ],
          ),
          new Container(
            padding: EdgeInsets.only(bottom: 10,top: 10),
            child: new Text(widget.articleItem.title,
              style: TextStyle(
                fontSize: 15
              ),),
          ),
          new Row(
            // mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              new Icon(Icons.access_time),
              new Text(widget.articleItem.niceDate),
              new Expanded(
                  flex: 1,
                  child: new Align(
                    alignment: Alignment.centerRight,
                    child:  new Icon(Icons.collections),
                  )
              ),
            ],
          ),
        ],
      ),
    );
  }
}
