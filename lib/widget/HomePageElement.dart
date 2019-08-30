import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Utils/Httputils.dart';
import 'package:flutter_app/Utils/Toast.dart';
import 'package:flutter_app/http/apis.dart';
import 'package:flutter_app/models/ArticleModel.dart';
import 'package:flutter_app/models/BannerModel.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'CardWidget.dart';
import 'WebViewWidget.dart';
import 'tabbar/TabBarPageFirst.dart';
import 'tabbar/TabBarPageFour.dart';
import 'tabbar/TabBarPageSecond.dart';
import 'tabbar/TabBarPageThree.dart';

class HomePage extends StatefulWidget {
  @override
  _ScaffoldRouteState createState() => _ScaffoldRouteState();
}

class _ScaffoldRouteState extends State<HomePage> with SingleTickerProviderStateMixin{
  int _selectedIndex = 0;
  List tabs = ["新闻", "历史", "图片",];

  TabController _tabController;
  List<BottomNavigationBarItem> BottomNavigationBarItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
    BottomNavigationBarItem(icon: Icon(Icons.business), title: Text('Business')),
    BottomNavigationBarItem(icon: Icon(Icons.school), title: Text('School')),
  ];

  List<Widget> pageViews = [test1(),test(),TabBarPageThree(),];

  @override
  void initState() {
    super.initState();
    // 创建Controller
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( //导航栏
        title: Text("App Name"),
        actions: <Widget>[ //导航栏右侧菜单
          IconButton(icon: Icon(Icons.share), onPressed: () {}),
        ],
      ),
      drawer: new MyDrawer(), //抽屉
      bottomNavigationBar: BottomNavigationBar( // 底部导航
        items:BottomNavigationBarItems,
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton( //悬浮按钮
          child: Icon(Icons.add),
          onPressed:_onAdd
      ),
      body: IndexedStack(
          children: pageViews,
          index: _selectedIndex
      ),
    );
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  void _onAdd(){
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        // DrawerHeader consumes top MediaQuery padding.
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(
                      child: Image.asset(
                        "imgs/avatar.png",
                        width: 80,
                      ),
                    ),
                  ),
                  Text(
                    "Wendux",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text('Add account'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Manage accounts'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class test extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return testState();
  }

}

class testState extends State<test> with SingleTickerProviderStateMixin{

  List tabs = ["新闻", "历史", "图片","哈哈","hahah"];
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Material(
          color: Colors.blue,
          child: TabBar(
              //indicatorColor:Colors.red ,
              labelColor: Colors.white,
              controller: _tabController,
              tabs: tabs.map((e) => Tab(text: e)).toList()),
        ),
        //TabBarView必须用Expanded包含才不会报错
        Expanded(
          child: TabBarView(
            controller:_tabController ,
            children: tabs.map((e) { //创建3个Tab页
              return Container(
                alignment: Alignment.center,
                child: Text(e, textScaleFactor: 5),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}

class test1 extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return test1State();
  }

}

class test1State extends State<test1> {
  int mArticleIndex = 0;
  List<BannerModelData> mBannerData  = new List<BannerModelData>();
  List<ArticleModelDataData> mArticleModelDataData = new List<ArticleModelDataData>();
  ScrollController _scrollController = ScrollController();

  bool isLoading = false; //listview的控制器

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        Toast.show(context, "滑动到了最底部");
        _getMore();
      }
    });


  }
  void initData() {
    initBannerData();
    initArticleData();
  }

  void initArticleData() {
    mArticleIndex = 0;
    mArticleModelDataData.clear();
    loadArticleData();
  }
   initBannerData() async {
    mBannerData.clear();
    Map<String, dynamic> httpGetTest = await  HttpUtils.HttpGetTest(WanAndroidApis.HOME_BANNER_URL);
    BannerModelEntity model =  BannerModelEntity.fromJson(httpGetTest);
    setState(() {
       mBannerData.addAll(model.data);
    });
  }

  loadArticleData() async {
    String ArticleUrl = WanAndroidApis.HOME_ARTICLE_URL_BEFORE+"$mArticleIndex"+WanAndroidApis.HOME_ARTICLE_URL_AFTER;
    Map<String, dynamic> model = await  HttpUtils.HttpGetTest(ArticleUrl);
    ArticleModelEntity articleModel = ArticleModelEntity.fromJson(model);
    setState(() {
      mArticleModelDataData.addAll(articleModel.data.datas);
    });

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: ListView.builder(
          controller: _scrollController,
          itemCount: mArticleModelDataData.length + 2,
          itemBuilder: (BuildContext context,int index){
            return _homePage(index);
          }
              ),
    );
  }

  Future<Null>  _onRefresh() async {
    initArticleData();
  }

  Future _getMore() async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
      mArticleIndex++;
      loadArticleData();
      isLoading = false;

    }
  }


  banner() {
    return Container(
      height: 200,
      padding: EdgeInsets.all(10),
      child: mBannerData.length == 0 ? null: new Swiper(
        autoplay: true,
        pagination: SwiperPagination(
            builder: DotSwiperPaginationBuilder(
                size: 5, //点点没选中时候的大小
                activeSize: 8, //点点选中后的大小
                color: Colors.grey, //点点的颜色
                activeColor: Colors.deepOrangeAccent),
            alignment: Alignment.bottomCenter),

        itemBuilder: (BuildContext context, int index) {
          return CachedNetworkImage(
            imageUrl: mBannerData[index].imagePath,
            placeholder: (context, url) => new CircularProgressIndicator(),
            errorWidget: (context, url, error) => new Icon(Icons.error),
          );
        },
        itemCount: mBannerData.length,
        onTap: (index) =>_onTap(index),
      ),
    );
  }

   _homePage(int index) {
    if(index == 0){
      return banner();
    }else if(index == mArticleModelDataData.length + 1){
      return _getMoreWidget();
    }else{
      return article(index);
    }

    //return index == 0 ? banner():article(index);
  }

  _onTap(index) {
    Toast.show(context, "text $index");
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => WebViewWidget(
          url: mBannerData[index].url,
          title: mBannerData[index].title,
        )));
  }

  article(int index) {
   // return new Text(mArticleModelDataData[index - 1].title);
    return new CardWidget(articleItem: mArticleModelDataData[index - 1]);
  }

  Widget _getMoreWidget() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              '加载中...     ',
              style: TextStyle(fontSize: 16.0),
            ),
            CircularProgressIndicator(strokeWidth: 1.0,)
          ],
        ),
      ),
    );
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }




}