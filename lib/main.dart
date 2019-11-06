import 'package:flutter/material.dart';
import 'package:flutter_app/%E5%9F%BA%E7%A1%80%E7%BB%84%E4%BB%B6/BUTTON/ButtonBasicUsage.dart';
import 'package:flutter_app/%E5%9F%BA%E7%A1%80%E7%BB%84%E4%BB%B6/TEXT/BasicTextUsage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: "/", //名为"/"的路由作为应用的home(首页)
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),

      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> _list = new List();
    for (int i = 0; i < titleItems.length; i++) {
      _list.add(buildListData(
          context, titleItems[i], iconItems[i], subTitleItems[i]));
    }
    // 分割线
    // var divideTiles = ListTile.divideTiles(context: context, tiles: _list).toList();

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Flutter Demo'),
      ),
      body: new Scrollbar(
        // ListView.separated写法
        child: new ListView.separated(
            itemBuilder: (context, item) {
              return buildListData(context, titleItems[item], iconItems[item],
                  subTitleItems[item]);
            },
            separatorBuilder: (BuildContext context, int index) =>
                new Divider(),
            itemCount: titleItems.length),
      ),
    );
  }

  Widget buildListData(BuildContext context, String titleItem, Icon iconItem,
      String subTitleItem) {
    return new ListTile(
      leading: iconItem,
      title: new Text(
        titleItem,
        style: TextStyle(fontSize: 18),
      ),
      subtitle: new Text(
        subTitleItem,
      ),
      trailing: new Icon(Icons.keyboard_arrow_right),
      onTap: () {
        if (titleItem == "文本、字体样式") {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return BasicTextUsage();
          }));
        } else if (titleItem == "按钮") {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ButtonBasicUsage();
          }));
        }
      },
    );
  }

  // 数据源
  List<String> titleItems = <String>[
    '文本、字体样式',
    '按钮'
    // , 'print',
    // 'router', 'pages',
    // 'zoom_out_map', 'zoom_out',
    // 'youtube_searched_for', 'wifi_tethering',
    // 'wifi_lock', 'widgets',
    // 'weekend', 'web',
    // '图accessible', 'ac_unit',
  ];

  List<Icon> iconItems = <Icon>[
    new Icon(Icons.keyboard), new Icon(Icons.radio_button_checked)
    // ,
    // new Icon(Icons.router), new Icon(Icons.pages),
    // new Icon(Icons.zoom_out_map), new Icon(Icons.zoom_out),
    // new Icon(Icons.youtube_searched_for), new Icon(Icons.wifi_tethering),
    // new Icon(Icons.wifi_lock), new Icon(Icons.widgets),
    // new Icon(Icons.weekend), new Icon(Icons.web),
    // new Icon(Icons.accessible), new Icon(Icons.ac_unit),
  ];

  List<String> subTitleItems = <String>[
    'subTitle: 文本的基本使用', 'subTitle: 按钮的基本使用'
    //  ,
    // 'subTitle: router', 'subTitle: pages',
    // 'subTitle: zoom_out_map', 'subTitle: zoom_out',
    // 'subTitle: youtube_searched_for', 'subTitle: wifi_tethering',
    // 'subTitle: wifi_lock', 'subTitle: widgets',
    // 'subTitle: weekend', 'subTitle: web',
    // 'subTitle: accessible', 'subTitle: ac_unit',
  ];
}
