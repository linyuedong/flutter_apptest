package com.me.flutter_app;

import android.os.Bundle;

import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.flutter.view.FlutterView;
import plugins.LogPlugin;


public class MainActivity extends FlutterActivity {

  private FlutterView flutterView;

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    flutterView = getFlutterView();
    GeneratedPluginRegistrant.registerWith(this);
    LogPlugin.registerLogger(flutterView);

  }

}
