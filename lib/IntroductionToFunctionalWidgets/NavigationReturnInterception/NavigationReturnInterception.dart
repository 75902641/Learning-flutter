import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationReturnInterception extends StatefulWidget {
  @override
  _NavigationReturnInterceptionState createState() => _NavigationReturnInterceptionState();
}

class _NavigationReturnInterceptionState extends State<NavigationReturnInterception> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('导航返回拦截（WillPopScope）'),),
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('为了避免用户误触返回按钮而导致APP退出，在很多APP中都拦截了用户点击返回键的按钮，然后进行一些防误触判断，比如当用户在某一个时间段内点击两次时，才会认为用户是要退出（而非误触）。Flutter中可以通过WillPopScope来实现返回按钮拦截，我们看看WillPopScope的默认构造函数：\n\nconst WillPopScope({\n  ...\n  @required WillPopCallback onWillPop,\n  @required Widget child\n})\n\nonWillPop是一个回调函数，当用户点击返回按钮时被调用（包括导航返回按钮及Android物理返回按钮）。该回调需要返回一个Future对象，如果返回的Future最终值为false时，则当前路由不出栈(不会返回)；最终值为true时，当前路由出栈退出。我们需要提供这个回调来决定是否退出。\n'),
              Text('示例\n', style: TextStyle(fontSize: 20),),
              Text("为了防止用户误触返回键退出，我们拦截返回事件。当用户在1秒内点击两次返回按钮时，则退出；如果间隔超过1秒则不退出，并重新记时。代码如下：\n\nimport 'package:flutter/material.dart';\n\nclass WillPopScopeTestRoute extends StatefulWidget {\n  @override\n  WillPopScopeTestRouteState createState() {\n    return new WillPopScopeTestRouteState();\n  }\n}\n\nclass WillPopScopeTestRouteState extends State<WillPopScopeTestRoute> {\n  DateTime _lastPressedAt; //上次点击时间\n\n  @override\n  Widget build(BuildContext context) {\n    return new WillPopScope(\n        onWillPop: () async {\n          if (_lastPressedAt == null || DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)) {\n            //两次点击间隔超过1秒则重新计时\n            _lastPressedAt = DateTime.now();\n            return false;\n          }\n          return true;\n        },\n        child: Container(\n          alignment: Alignment.center,\n          child: Text('1秒内连续按两次返回键退出'),\n        )\n    );\n  }\n}\n"),


            ],
          ),
        ),
      ),
    );
  }
}