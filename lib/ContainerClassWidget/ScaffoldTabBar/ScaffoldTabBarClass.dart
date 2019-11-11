import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ContainerClassWidget/ScaffoldTabBar/ScaffoldRoute.dart';

class ScaffoldTabBarClass extends StatefulWidget {
  @override
  _ScaffoldTabBarClassState createState() => _ScaffoldTabBarClassState();
}

class _ScaffoldTabBarClassState extends State<ScaffoldTabBarClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scaffold、TabBar、底部导航'),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                  'Material组件库提供了丰富多样的组件，本节介绍一些常用的组件，其余的读者可以自行查看文档或Flutter Gallery中Material组件部分的示例。\n\nFlutter Gallery是Flutter官方提供的Flutter Demo，源码位于flutter源码中的examples目录下，笔者强烈建议用户将Flutter Gallery示例跑起来，它是一个很全面的Flutter示例应用，是非常好的参考Demo，也是笔者学习Flutter的第一手资料。\n'),
              Text(
                'Scaffold\n',
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                  '一个完整的数路由页可能会包含导航栏、抽屉菜单(Drawer)以及底部Tab导航菜单等。如果每个路由页面都需要开发者自己手动去实现这些，这会是一件非常麻烦且无聊的事。幸运的是，Flutter Material组件库提供了一些现成的组件来减少我们的开发任务。Scaffold是一个路由页的骨架，我们使用它可以很容易地拼装出一个完整的页面。\n'),
              Text(
                '示例\n',
                style: TextStyle(fontSize: 20.0),
              ),
              Image.network(
                'https://cdn.jsdelivr.net/gh/flutterchina/flutter-in-action/docs/imgs/5-18.png',
                width: 200,
              ),
              Image.network(
                'https://cdn.jsdelivr.net/gh/flutterchina/flutter-in-action/docs/imgs/5-19.png',
                width: 200,
              ),
              Text(
                  "\n实现代码如下：\n\nclass ScaffoldRoute extends StatefulWidget {\n  @override\n  _ScaffoldRouteState createState() => _ScaffoldRouteState();\n}\n\nclass _ScaffoldRouteState extends State<ScaffoldRoute> {\n  int _selectedIndex = 1;\n\n  @override\n  Widget build(BuildContext context) {\n    return Scaffold(\n      appBar: AppBar( //导航栏\n        title: Text('App Name'), \n        actions: <Widget>[ //导航栏右侧菜单\n          IconButton(icon: Icon(Icons.share), onPressed: () {}),\n        ],\n      ),\n      drawer: new MyDrawer(), //抽屉\n      bottomNavigationBar: BottomNavigationBar( // 底部导航\n        items: <BottomNavigationBarItem>[\n          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),\n          BottomNavigationBarItem(icon: Icon(Icons.business), title: Text('Business')),\n          BottomNavigationBarItem(icon: Icon(Icons.school), title: Text('School')),\n        ],\n        currentIndex: _selectedIndex,\n        fixedColor: Colors.blue,\n        onTap: _onItemTapped,\n      ),\n      floatingActionButton: FloatingActionButton( //悬浮按钮\n          child: Icon(Icons.add),\n          onPressed:_onAdd\n      ),\n    );\n  }\n  void _onItemTapped(int index) {\n    setState(() {\n      _selectedIndex = index;\n    });\n  }\n  void _onAdd(){\n  }\n}\n\n上面代码中我们用到了如下组件：\n组件名称     解释\nAppBar      一个导航栏骨架\nMyDrawer      抽屉菜单\nBottomNavigationBar     底部导航栏\nFloatingActionButton      漂浮按钮\n\n点击下面按钮看运行效果，点击右上角分享按钮返回"),
              RaisedButton(
                child: Text('查看效果'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ScaffoldRoute();
                  }));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
