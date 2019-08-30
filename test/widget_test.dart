// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_app/Utils/Httputils.dart';
import 'package:flutter_app/http/apis.dart';
import 'package:flutter_app/models/ArticleModel.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_app/main.dart';

void main() {
//  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
//    // Build our app and trigger a frame.
//    await tester.pumpWidget(MyApp());
//
//    // Verify that our counter starts at 0.
//    expect(find.text('0'), findsOneWidget);
//    expect(find.text('1'), findsNothing);
//
//    // Tap the '+' icon and trigger a frame.
//    await tester.tap(find.byIcon(Icons.add));
//    await tester.pump();
//
//    // Verify that our counter has incremented.
//    expect(find.text('0'), findsNothing);
//    expect(find.text('1'), findsOneWidget);
//  });
  test("String.split() splits the string on the delimiter", () {
    var string = "foo,bar,baz";
    expect(string.split(","), equals(["foo", "bar", "baz"]));
  });
  test("new Future.value() returns the value", () async {
    // bool r = await HttpUtils.HttpGetTest("https://www.wanandroid.com/banner/json");
   // print(r);
    int mArticleIndex = 0;
    String ArticleUrl = WanAndroidApis.HOME_ARTICLE_URL_BEFORE+"$mArticleIndex"+WanAndroidApis.HOME_ARTICLE_URL_AFTER;
    Map<String, dynamic> model = await  HttpUtils.HttpGetTest(ArticleUrl);
    ArticleModelEntity articleModel = ArticleModelEntity.fromJson(model);
    print(articleModel.data.datas[0].author);
    
  });

  test("aa",(){
    int mArticleIndex = 0;
    String ArticleUrl = WanAndroidApis.HOME_ARTICLE_URL_BEFORE+"$mArticleIndex"+WanAndroidApis.HOME_ARTICLE_URL_AFTER;
    print(ArticleUrl);
  });

}
