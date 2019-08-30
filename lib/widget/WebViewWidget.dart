import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewWidget extends StatefulWidget{

  final String url;
  final String title;
  const WebViewWidget({Key key, this.url, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WebViewState();
  }
}

class _WebViewState extends State<WebViewWidget>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WebviewScaffold(
      url: widget.url,
      withZoom: true,
      hidden: true,
      initialChild: Center(child: CircularProgressIndicator()),
      appBar: new AppBar(
        title: Text(widget.title),
      ),

    );
  }

}