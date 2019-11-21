import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/IntroductionToFunctionalWidgets/ColorAndTheme/NavBar.dart';
import 'package:flutter_app/IntroductionToFunctionalWidgets/ColorAndTheme/ThemeTestRoute.dart';

class ColorAndTheme extends StatefulWidget {
  @override
  _ColorAndThemeState createState() => _ColorAndThemeState();
}

class _ColorAndThemeState extends State<ColorAndTheme> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('颜色和主题'),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '颜色\n',
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                  '在介绍主题前我们先了解一些Flutter中的Color类。Color类中颜色以一个int值保存，我们知道显示器颜色是由红、绿、蓝三基色组成，每种颜色站8比特，存储结构如下：\n\nBit（位）            颜色\n0-7                       蓝色\n8-15                       绿色\n16-23                       红色\n24-31                       Alpha (不透明度)\n\n上面表格中的的字段在Color类中都有对应的属性，而Color中的众多方法也就是操作这些属性的，由于大多比较简单，读者可以查看类定义了解。在此我们主要讨论两点：色值转换和亮度。\n'),
              Text(
                '如何将颜色字符串转成Color对象\n',
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                  '如Web开发中的色值通常是一个字符串如"#dc380d"，它是一个RGB值，我们可以通过下面这些方法将其转为Color类：\n\nColor(0xffdc380d); //如果颜色固定可以直接使用整数值\n//颜色是一个字符串变量\nvar c = "dc380d";\nColor(int.parse(c,radix:16)|0xFF000000) //通过位运算符将Alpha设置为FF\nColor(int.parse(c,radix:16)).withAlpha(255)  //通过方法将Alpha设置为FF\n'),
              Text(
                '颜色亮度\n',
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                  '假如，我们要实现一个背景颜色和Title可以自定义的导航栏，并且背景色为深色时我们应该让Title显示为浅色；背景色为浅色时，Title显示为深色。要实现这个功能，我们就需要来计算背景色的亮度，然后动态来确定Title的颜色。Color类中提供了一个computeLuminance()方法，它可以返回一个[0-1]的一个值，数字越大颜色就越浅，我们可以根据它来动态确定Title的颜色，下面是导航栏NavBar的简单实现：\n代码看demo，测试代码如下：\n\nColumn(\n  children: <Widget>[\n    //背景为蓝色，则title自动为白色\n    NavBar(color: Colors.blue, title: "标题"), \n    //背景为白色，则title自动为黑色\n    NavBar(color: Colors.white, title: "标题"),\n  ]\n)\n\n运行效果如下\n'),
              NavBar(
                color: Colors.blue,
                title: '标题',
              ),
              NavBar(color: Colors.white, title: "标题"),
              Text(
                '\nMaterialColor\n',
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                  'MaterialColor是实现Material Design中的颜色的类，它包含一种颜色的10个级别的渐变色。MaterialColor通过"[]"运算符的索引值来代表颜色的深度，有效的索引有：50，100，200，…，900，数字越大，颜色越深。MaterialColor的默认值为索引等于500的颜色。举个例子，Colors.blue是预定义的一个MaterialColor类对象，定义如下：\n\nstatic const MaterialColor blue = MaterialColor(\n  _bluePrimaryValue,\n  <int, Color>{\n     50: Color(0xFFE3F2FD),\n    100: Color(0xFFBBDEFB),\n    200: Color(0xFF90CAF9),\n    300: Color(0xFF64B5F6),\n    400: Color(0xFF42A5F5),\n    500: Color(_bluePrimaryValue),\n    600: Color(0xFF1E88E5),\n    700: Color(0xFF1976D2),\n    800: Color(0xFF1565C0),\n    900: Color(0xFF0D47A1),\n  },\n);\nstatic const int _bluePrimaryValue = 0xFF2196F3;\n\nColors.blue[50]到Colors.blue[100]的色值从浅蓝到深蓝渐变，效果如图\n'),
              Image.network(
                'https://cdn.jsdelivr.net/gh/flutterchina/flutter-in-action/docs/imgs/7-5.jpeg',
                width: 200,
              ),
              Text(
                '\nTheme\n',
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                  'Theme组件可以为Material APP定义主题数据（ThemeData）。Material组件库里很多组件都使用了主题数据，如导航栏颜色、标题字体、Icon样式等。Theme内会使用InheritedWidget来为其子树共享样式数据。\n'),
              Text(
                'ThemeData\n',
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                  'ThemeData用于保存是Material 组件库的主题数据，Material组件需要遵守相应的设计规范，而这些规范可自定义部分都定义在ThemeData中了，所以我们可以通过ThemeData来自定义应用主题。在子组件中，我们可以通过Theme.of方法来获取当前的ThemeData。\n\n注意：Material Design 设计规范中有些是不能自定义的，如导航栏高度，ThemeData只包含了可自定义部分。\n\n我们看看ThemeData部分数据定义：\n\nThemeData({\n  Brightness brightness, //深色还是浅色\n  MaterialColor primarySwatch, //主题颜色样本，见下面介绍\n  Color primaryColor, //主色，决定导航栏颜色\n  Color accentColor, //次级色，决定大多数Widget的颜色，如进度条、开关等。\n  Color cardColor, //卡片颜色\n  Color dividerColor, //分割线颜色\n  ButtonThemeData buttonTheme, //按钮主题\n  Color cursorColor, //输入框光标颜色\n  Color dialogBackgroundColor,//对话框背景颜色\n  String fontFamily, //文字字体\n  TextTheme textTheme,// 字体主题，包括标题、body等文字样式\n  IconThemeData iconTheme, // Icon的默认样式\n  TargetPlatform platform, //指定平台，应用特定平台控件风格\n  ...\n})\n\n上面只是ThemeData的一小部分属性，完整的数据定义读者可以查看SDK。上面属性中需要说明的是primarySwatch，它是主题颜色的一个"样本色"，通过这个样本色可以在一些条件下生成一些其它的属性，例如，如果没有指定primaryColor，并且当前主题不是深色主题，那么primaryColor就会默认为primarySwatch指定的颜色，还有一些相似的属性如accentColor 、indicatorColor等也会受primarySwatch影响。\n'),
              Text(
                '示例\n',
                style: TextStyle(fontSize: 20.0),
              ),
              Text('我们实现一个路由换肤功能：\n'),
              RaisedButton(
                child: Text('点击查看示例效果'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ThemeTestRoute();
                  }));
                },
              ),
              Text(
                  '\n需要注意的有三点：\n\n可以通过局部主题覆盖全局主题，正如代码中通过Theme为第二行图标指定固定颜色（黑色）一样，这是一种常用的技巧，Flutter中会经常使用这种方法来自定义子树主题。那么为什么局部主题可以覆盖全局主题？这主要是因为widget中使用主题样式时是通过Theme.of(BuildContext context)来获取的，我们看看其简化后的代码：\n\nstatic ThemeData of(BuildContext context, { bool shadowThemeOnly = false }) {\n   // 简化代码，并非源码  \n   return context.inheritFromWidgetOfExactType(_InheritedTheme).theme.data\n}\n\ncontext.inheritFromWidgetOfExactType 会在widget树中从当前位置向上查找第一个类型为_InheritedTheme的widget。所以当局部指定Theme后，其子树中通过Theme.of()向上查找到的第一个_InheritedTheme便是我们指定的Theme。\n本示例是对单个路由换肤，如果想要对整个应用换肤，则可以去修改MaterialApp的theme属性。\n\n\n'),
            ],
          ),
        ),
      ),
    );
  }
}
