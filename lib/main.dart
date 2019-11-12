import 'package:flutter/material.dart';
import 'package:flutter_app/BasicControl/BUTTON/ButtonBasicUsage.dart';
import 'package:flutter_app/BasicControl/IMAGEDEMO/ImageBasicUsage.dart';
import 'package:flutter_app/BasicControl/ProgressIndicator/ProgressIndicators.dart';
import 'package:flutter_app/BasicControl/TEXT/BasicTextUsage.dart';
import 'package:flutter_app/ContainerClassWidget/Clip/ClipClass.dart';
import 'package:flutter_app/ContainerClassWidget/Container/ContainerClass.dart';
import 'package:flutter_app/ContainerClassWidget/DecorativeContainer/DecorativeContainer.dart';
import 'package:flutter_app/ContainerClassWidget/Padding/PaddingClass.dart';
import 'package:flutter_app/ContainerClassWidget/ScaffoldTabBar/ScaffoldTabBarClass.dart';
import 'package:flutter_app/ContainerClassWidget/SizeLimitClassContainer/SizeLimitClassContainer.dart';
import 'package:flutter_app/ContainerClassWidget/Transform/TransformClass.dart';
import 'package:flutter_app/LayoutClassComponent/AlignmentAndRelativePositioning/AlignmentAndRelativePositioning.dart';
import 'package:flutter_app/LayoutClassComponent/CascadingLayout/CascadingLayout.dart';
import 'package:flutter_app/LayoutClassComponent/FlexibleLayout/FlexibleLayout.dart';
import 'package:flutter_app/LayoutClassComponent/IntroductionToLayoutClassComponents/IntroductionToLayoutClassComponents.dart';
import 'package:flutter_app/LayoutClassComponent/LinearLayout/LinearLayoutRowColumn.dart';
import 'package:flutter_app/LayoutClassComponent/StreamingLayout/StreamingLayout.dart';
import 'BasicControl/InputBoxAndForm/InputBoxAndForm.dart';
import 'BasicControl/RadioSwitchAndCheckBox/RadioSwitchAndCheckBox.dart';

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
        } else if (titleItem == "图片") {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ImageBasicUsage();
          }));
        } else if (titleItem == '单选开关和复选框') {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return RadioSwitchAndCheckBox();
          }));
        } else if (titleItem == '输入框和表单') {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return InputBoxAndForm();
          }));
        } else if (titleItem == '进度指示器') {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ProgressIndicators();
          }));
        } else if (titleItem == '布局类组件简介') {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return IntroductionToLayoutClassComponents();
          }));
        } else if (titleItem == '线性布局') {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return LinearLayoutRowColumn();
          }));
        } else if (titleItem == '弹性布局') {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FlexibleLayout();
          }));
        } else if (titleItem == '流式布局') {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return StreamingLayout();
          }));
        } else if (titleItem == '层叠布局') {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return CascadingLayout();
          }));
        } else if (titleItem == '对齐与相对定位') {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AlignmentAndRelativePositioning();
          }));
        } else if (titleItem == '填充') {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return PaddingClass();
          }));
        } else if (titleItem == '尺寸限制类容器') {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return SizeLimitClassContainer();
          }));
        } else if (titleItem == '装饰容器DecoratedBox') {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DecorativeContainer();
          }));
        } else if (titleItem == '变换') {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return TransformClass();
          }));
        } else if (titleItem == 'Container') {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ContainerClass();
          }));
        } else if (titleItem == 'Scaffold、TabBar、底部导航') {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ScaffoldTabBarClass();
          }));
        } else if (titleItem == '剪裁') {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ClipClass();
          }));
        }
      },
    );
  }

  // 数据源
  List<String> titleItems = <String>[
    '文本、字体样式',
    '按钮',
    '图片',
    '单选开关和复选框',
    '输入框和表单',
    '进度指示器',
    '布局类组件简介',
    '线性布局',
    '弹性布局',
    '流式布局',
    '层叠布局',
    '对齐与相对定位',
    '填充',
    '尺寸限制类容器',
    '装饰容器DecoratedBox',
    '变换',
    'Container',
    'Scaffold、TabBar、底部导航',
    '剪裁',
  ];

  List<Icon> iconItems = <Icon>[
    new Icon(Icons.keyboard),
    new Icon(Icons.radio_button_checked),
    new Icon(Icons.router),
    new Icon(Icons.pages),
    new Icon(Icons.radio_button_unchecked),
    new Icon(Icons.slideshow),
    new Icon(Icons.slideshow),
    new Icon(Icons.zoom_out_map),
    new Icon(Icons.zoom_out),
    new Icon(Icons.youtube_searched_for),
    new Icon(Icons.wifi_tethering),
    new Icon(Icons.wifi_lock),
    new Icon(Icons.widgets),
    new Icon(Icons.weekend),
    new Icon(Icons.web),
    new Icon(Icons.accessible),
    new Icon(Icons.ac_unit),
    new Icon(Icons.keyboard),
    new Icon(Icons.radio_button_checked),
  ];

  List<String> subTitleItems = <String>[
    'subTitle: 文本的基本使用',
    'subTitle: 按钮的基本使用',
    'subTitle: 图片和ICON',
    'subTitle: 单选开关和复选框',
    'subTitle: 输入框及表单',
    'subTitle: 进度指示器',
    'subTitle: 布局类组件简介',
    'subTitle: 线性布局（Row和Column）',
    'subTitle: 弹性布局（Flex）',
    'subTitle: 流式布局（Wrap、Flow）',
    'subTitle: 层叠布局（Stack、Positioned）',
    'subTitle: 对齐与相对定位（Align）',
    'subTitle: 填充（Padding）',
    'subTitle: 尺寸限制类容器',
    'subTitle: 装饰容器DecoratedBox',
    'subTitle: 变换（Transform）',
    'subTitle: Container容器',
    'subTitle: Scaffold、TabBar、底部导航',
    'subTitle: 剪裁（Clip）',
  ];
}
