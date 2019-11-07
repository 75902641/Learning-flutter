import 'package:flutter/material.dart';
import 'package:flutter_app/BasicControl/InputBoxAndForm/FocusTestRoute.dart';

class InputBoxAndForm extends StatefulWidget {
  @override
  _InputBoxAndFormState createState() => _InputBoxAndFormState();
}

class _InputBoxAndFormState extends State<InputBoxAndForm> {
  TextEditingController _unameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextEditingController _selectionController = TextEditingController();
    _selectionController.text = "hello world!";
    _selectionController.selection = TextSelection(
        baseOffset: 2, extentOffset: _selectionController.text.length);
    return Scaffold(
      appBar: AppBar(
        title: Text('输入框和表单'),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'TextField\n',
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                  'TextField用于文本输入，它提供了很多属性，我们先简单介绍一下主要属性的作用，然后通过几个示例来演示一下关键属性的用法。\n\nconst TextField({\n  ...\n  TextEditingController controller, \n  FocusNode focusNode,\n  InputDecoration decoration = const InputDecoration(),\n  TextInputType keyboardType,\n  TextInputAction textInputAction,\n  TextStyle style,\n  TextAlign textAlign = TextAlign.start,\n  bool autofocus = false,\n  bool obscureText = false,\n  int maxLines = 1,\n  int maxLength,\n  bool maxLengthEnforced = true,\n  ValueChanged<String> onChanged,\n  VoidCallback onEditingComplete,\n  ValueChanged<String> onSubmitted,\n  List<TextInputFormatter> inputFormatters,\n  bool enabled,\n  this.cursorWidth = 2.0,\n  this.cursorRadius,\n  this.cursorColor,\n  ...\n})\n\n      controller：编辑框的控制器，通过它可以设置/获取编辑框的内容、选择编辑内容、监听编辑文本改变事件。大多数情况下我们都需要显式提供一个controller来与文本框交互。如果没有提供controller，则TextField内部会自动创建一个。\n      focusNode：用于控制TextField是否占有当前键盘的输入焦点。它是我们和键盘交互的一个句柄（handle）。\n      InputDecoration：用于控制TextField的外观显示，如提示文本、背景颜色、边框等。\n      keyboardType：用于设置该输入框默认的键盘输入类型，取值如下：\n\nTextInputType枚举值	          含义\ntext          文本输入键盘\nmultiline          多行文本，需和maxLines配合使用(设为null或大于1)\nnumber          数字；会弹出数字键盘\nphone          优化后的电话号码输入键盘；会弹出数字键盘并显示“* #”\ndatetime           优化后的日期输入键盘；Android上会显示“: -”\nemailAddress          优化后的电子邮件地址；会显示“@ .”\nurl          优化后的url输入键盘； 会显示“/ .”\n\n      textInputAction：键盘动作按钮图标(即回车键位图标)，它是一个枚举值，有多个可选值，全部的取值列表读者可以查看API文档，下面是当值为TextInputAction.search时，原生Android系统下键盘样式如图'),
              Image.network(
                "https://cdn.jsdelivr.net/gh/flutterchina/flutter-in-action/docs/imgs/3-24.png",
                width: 200.0,
              ),
              Text(
                  '      style：正在编辑的文本样式。\n      textAlign: 输入框内编辑文本在水平方向的对齐方式。\n      autofocus: 是否自动获取焦点。\n      obscureText：是否隐藏正在编辑的文本，如用于输入密码的场景等，文本内容会用“•”替换。\n      maxLines：输入框的最大行数，默认为1；如果为null，则无行数限制。\n      maxLength和maxLengthEnforced ：maxLength代表输入框文本的最大长度，设置后输入框右下角会显示输入的文本计数。maxLengthEnforced决定当输入文本长度超过maxLength时是否阻止输入，为true时会阻止输入，为false时不会阻止输入但输入框会变红。\n      onChange：输入框内容改变时的回调函数；注：内容改变事件也可以通过controller来监听。\n      onEditingComplete和onSubmitted：这两个回调都是在输入框输入完成时触发，比如按了键盘的完成键（对号图标）或搜索键（🔍图标）。不同的是两个回调签名不同，onSubmitted回调是ValueChanged<String>类型，它接收当前输入内容做为参数，而onEditingComplete不接收参数。\n      inputFormatters：用于指定输入格式；当用户输入内容改变时，会根据指定的格式来校验。\n      enable：如果为false，则输入框会被禁用，禁用状态不接收输入和事件，同时显示禁用态样式（在其decoration中定义）。\n      cursorWidth、cursorRadius和cursorColor：这三个属性是用于自定义输入框光标宽度、圆角和颜色的。\n'),
              Text(
                '示例：登录输入框\n布局',
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                  'Column(\n        children: <Widget>[\n          TextField(\n            autofocus: true,\n            decoration: InputDecoration(\n                labelText: "用户名",\n                hintText: "用户名或邮箱",\n                prefixIcon: Icon(Icons.person)\n            ),\n          ),\n          TextField(\n            decoration: InputDecoration(\n                labelText: "密码",\n                hintText: "您的登录密码",\n                prefixIcon: Icon(Icons.lock)\n            ),\n            obscureText: true,\n          ),\n        ],\n);\n运行后，效果如下'),
              TextField(
                autofocus: false,
                controller: _unameController,
                decoration: InputDecoration(
                    labelText: '用户名',
                    hintText: '用户名或邮箱',
                    prefixIcon: Icon(Icons.person)),
                onChanged: (v) {
                  // print(_unameController.text);
                },
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: '密码',
                    hintText: '您的登录密码',
                    prefixIcon: Icon(Icons.lock)),
                onChanged: (v) {
                  print("onChange: $v");
                },
              ),
              Text(
                '\n获取输入内容',
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                  '获取输入内容有两种方式：\n\n1.定义两个变量，用于保存用户名和密码，然后在onChange触发时，各自保存一下输入内容。\n2.通过controller直接获取。\n\n第一种方式比较简单，不在举例，我们来重点看一下第二种方式，我们以用户名输入框举例：\n定义一个controller：\n\n//定义一个controller\nTextEditingController _unameController = TextEditingController();\n\n然后设置输入框controller：\n\nTextField(\n    autofocus: true,\n    controller: _unameController, //设置controller\n    ...\n)\n\n通过controller获取输入框内容\nprint(_unameController.text)\n'),
              Text(
                '监听文本变化',
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                  '监听文本变化也有两种方式：\n1.设置onChange回调，如：\n\nTextField(\n    autofocus: true,\n    onChanged: (v) {\n      print("onChange: \$v");\n    }\n)\n\n通过controller监听，如：\n\n@override\nvoid initState() {\n  //监听输入改变  \n  _unameController.addListener((){\n    print(_unameController.text);\n  });\n}\n\n两种方式相比，onChanged是专门用于监听文本变化，而controller的功能却多一些，除了能监听文本变化外，它还可以设置默认值、选择文本，下面我们看一个例子：\n\n创建一个controller:\n\nTextEditingController _selectionController =  TextEditingController();\n\n设置默认值，并从第三个字符开始选中后面的字符\n\n_selectionController.text="hello world!";\n_selectionController.selection=TextSelection(\n    baseOffset: 2,\n    extentOffset: _selectionController.text.length\n);\n\n设置controller:\nTextField(\n  controller: _selectionController,\n)\n运行效果如下'),
              TextField(
                controller: _selectionController,
              ),
              Text(
                '\n控制焦点\n',
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                  '焦点可以通过FocusNode和FocusScopeNode来控制，默认情况下，焦点由FocusScope来管理，它代表焦点控制范围，可以在这个范围内可以通过FocusScopeNode在输入框之间移动焦点、设置默认焦点等。我们可以通过FocusScope.of(context) 来获取Widget树中默认的FocusScopeNode。下面看一个示例，在此示例中创建两个TextField，第一个自动获取焦点，然后创建两个按钮：\n\n      点击第一个按钮可以将焦点从第一个TextField挪到第二个TextField。\n      点击第二个按钮可以关闭键盘。\n\n我们要实现的效果如图'),
              Image.network(
                  "https://cdn.jsdelivr.net/gh/flutterchina/flutter-in-action/docs/imgs/3-27.png",
                  width: 200),
              Text(
                  '\n代码如下：\n\nclass FocusTestRoute extends StatefulWidget {\n  @override\n  _FocusTestRouteState createState() => new _FocusTestRouteState();\n}\n\nclass _FocusTestRouteState extends State<FocusTestRoute> {\n  FocusNode focusNode1 = new FocusNode();\n  FocusNode focusNode2 = new FocusNode();\n  FocusScopeNode focusScopeNode;\n\n  @override\n  Widget build(BuildContext context) {\n    return Padding(\n      padding: EdgeInsets.all(16.0),\n      child: Column(\n        children: <Widget>[\n          TextField(\n            autofocus: true, \n            focusNode: focusNode1,//关联focusNode1\n            decoration: InputDecoration(\n                labelText: "input1"\n            ),\n          ),\n          TextField(\n           focusNode: focusNode2,//关联focusNode2\n            decoration: InputDecoration(\n                labelText: "input2"\n            ),\n          ),\n          Builder(builder: (ctx) {\n            return Column(\n              children: <Widget>[\n                RaisedButton(\n                  child: Text("移动焦点"),\n                  onPressed: () {\n                    //将焦点从第一个TextField移到第二个TextField\n                    // 这是一种写法FocusScope.of(context).requestFocus(focusNode2);\n                   // 这是第二种写法\n                    if(null == focusScopeNode){\n                      focusScopeNode = FocusScope.of(context);\n                    }\n                    focusScopeNode.requestFocus(focusNode2);\n                  },\n                ),\n                RaisedButton(\n                  child: Text("隐藏键盘"),\n                  onPressed: () {\n                    // 当所有编辑框都失去焦点时键盘就会收起\n                    focusNode1.unfocus();\n                    focusNode2.unfocus();\n                  },\n                ),\n              ],\n            );\n          },\n          ),\n        ],\n      ),\n    );\n  }\n}\nFocusNode和FocusScopeNode还有一些其它的方法，详情可以查看API文档。 '),
              RaisedButton(
                child: Text('查看代码运行效果'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return FocusTestRoute();
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
