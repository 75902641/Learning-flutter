import 'package:flutter/material.dart';
import 'package:flutter_app/BasicControl/InputBoxAndForm/FocusTestRoute.dart';
import 'package:flutter_app/BasicControl/InputBoxAndForm/FormTestRoute.dart';

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
                  '监听文本变化也有两种方式：\n1.设置onChange回调，如：\n\nTextField(\n    autofocus: true,\n    onChanged: (v) {\n      print("onChange: \$v");\n    }\n)\n\n通过controller���������听，如：\n\n@override\nvoid initState() {\n  //监听输入改变  \n  _unameController.addListener((){\n    print(_unameController.text);\n  });\n}\n\n两种方式相比，onChanged是专门用于监听文本变化，而controller的功能却多一些，除了能监听文本变化外，它还可以设置默认值、选择文本，下面我们看一个例子：\n\n创建一个controller:\n\nTextEditingController _selectionController =  TextEditingController();\n\n设置默认值，并从第三个字符开始选中后面的字符\n\n_selectionController.text="hello world!";\n_selectionController.selection=TextSelection(\n    baseOffset: 2,\n    extentOffset: _selectionController.text.length\n);\n\n设置controller:\nTextField(\n  controller: _selectionController,\n)\n运行效果如下'),
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
              Text(
                '\n自定义样式\n',
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                  '虽然我们可以通过decoration属性来定义输入框样式，下面以自定义输入框下划线颜色为例来介绍一下：\n\nTextField(\n  decoration: InputDecoration(\n    labelText: "请输入用户名",\n    prefixIcon: Icon(Icons.person),\n    // 未获得焦点下划线设为灰色\n    enabledBorder: UnderlineInputBorder(\n      borderSide: BorderSide(color: Colors.grey),\n    ),\n    //获得焦点下划线设为蓝色\n    focusedBorder: UnderlineInputBorder(\n      borderSide: BorderSide(color: Colors.blue),\n    ),\n  ),\n),\n\n上面代码我们直接通过InputDecoration的enabledBorder和focusedBorder来分别设置了输入框在未获取焦点和获得焦点后的下划线颜色。另外，我们也可以通过主题来自定义输入框的样式，下面我们探索一下如何在不使用enabledBorder和focusedBorder的情况下来自定义下滑线颜色。\n\n由于TextField在绘制下划线时使用的颜色是主题色里面的hintColor，但提示文本颜色也是用的hintColor， 如果我们直接修改hintColor，那么下划线和提示文本的颜色都会变。值得高兴的是decoration中可以设置hintStyle，它可以覆盖hintColor，并且主题中可以通过inputDecorationTheme来设置输入框默认的decoration。所以我们可以通过主题来自定义，代码如下：\n\nTheme(\n  data: Theme.of(context).copyWith(\n      hintColor: Colors.grey[200], //定义下划线颜色\n      inputDecorationTheme: InputDecorationTheme(\n          labelStyle: TextStyle(color: Colors.grey),//定义label字体样式\n          hintStyle: TextStyle(color: Colors.grey, fontSize: 14.0)//定义提示文本样式\n      )\n  ),\n  child: Column(\n    children: <Widget>[\n      TextField(\n        decoration: InputDecoration(\n            labelText: "用户名",\n            hintText: "用户名或邮箱",\n            prefixIcon: Icon(Icons.person)\n        ),\n      ),\n      TextField(\n        decoration: InputDecoration(\n            prefixIcon: Icon(Icons.lock),\n            labelText: "密码",\n            hintText: "您的登录密码",\n            hintStyle: TextStyle(color: Colors.grey, fontSize: 13.0)\n        ),\n        obscureText: true,\n      )\n    ],\n  )\n)\n\n运行效果如图'),
              Image.network(
                "https://cdn.jsdelivr.net/gh/flutterchina/flutter-in-action/docs/imgs/3-28.png",
                width: 200,
              ),
              Text(
                  '我们成功的自定义了下划线颜色和提问文字样式，细心的读者可能已经发现，通过这种方式自定义后，输入框在获取焦点时，labelText不会高亮显示了，正如上图中的"用户名"本应该显示蓝色，但现在却显示为灰色，并且我们还是无法定义下划线宽度。另一种灵活的方式是直接隐藏掉TextField本身的下划线，然后通过Container去嵌套定义样式，如:\n\nContainer(\n  child: TextField(\n    keyboardType: TextInputType.emailAddress,\n    decoration: InputDecoration(\n        labelText: "Email",\n        hintText: "电子邮件地址",\n        prefixIcon: Icon(Icons.email),\n        border: InputBorder.none //隐藏下划线\n    )\n  ),\n  decoration: BoxDecoration(\n      // 下滑线浅灰色，宽度1像素\n      border: Border(bottom: BorderSide(color: Colors.grey[200], width: 1.0))\n  ),\n)\n\n运行效果'),
              Container(
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: '电子邮件地址',
                      prefixIcon: Icon(Icons.email),
                      border: InputBorder.none),
                ),
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: Colors.grey[200], width: 1.0))),
              ),
              Text(
                  '\n通过这种组件组合的方式，也可以定义背景圆角等。一般来说，优先通过decoration来自定义样式，如果decoration实现不了，再用widget组合的方式。\n思考题：在这个示例中，下划线颜色是固定的，所以获得焦点后颜色仍然为灰色，如何实现点击后下滑线也变色呢？'),
              Text(
                '\n表单Form\n',
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                  '实际业务中，在正式向服务器提交数据前，都会对各个输入框数据进行合法性校验，但是对每一个TextField都分别进行校验将会是一件很麻烦的事。还有，如果用户想清除一组TextField的内容，除了一个一个清除有没有什么更好的办法呢？为此，Flutter提供了一个Form 组件，它可以对输入框进行分组，然后进行一些统一操作，如输入内容校验、输入框重置以及输入内容保存。'),
              Text(
                '\nForm\n',
                style: TextStyle(fontSize: 20.0),
              ),
              Text('Form继承自StatefulWidget对象，它对应的状态类为FormState。我们先看看Form类的定义：\n\nForm({\n  @required Widget child,\n  bool autovalidate = false,\n  WillPopCallback onWillPop,\n  VoidCallback onChanged,\n})\n      autovalidate：是否自动校验输入内容；当为true时，每一个子FormField内容发生变化时都会自动校验合法性，并直接显示错误信息。否则，需要通过调用FormState.validate()来手动校验。\n      onWillPop：决定Form所在的路由是否可以直接返回（如点击返回按钮），该回调返回一个Future对象，如果Future的最终结果是false，则当前路由不会返回；如果为true，则会返回到上一个路由。此属性通常用于拦截返回按钮。\n      onChanged：Form的任意一个子FormField内容发生变化时会触发此回调。'),
              Text(
                '\nFormField\n',
                style: TextStyle(fontSize: 20.0),
              ),
              Text('Form的子孙元素必须是FormField类型，FormField是一个抽象类，定义几个属性，FormState内部通过它们来完成操作，FormField部分定义如下：\n\nconst FormField({\n  ...\n  FormFieldSetter<T> onSaved, //保存回调\n  FormFieldValidator<T>  validator, //验证回调\n  T initialValue, //初始值\n  bool autovalidate = false, //是否自动校验。\n})\n\n为了方便使用，Flutter提供了一个TextFormField组件，它继承自FormField类，也是TextField的一个包装类，所以除了FormField定义的属性之外，它还包括TextField的属性。'),
Text(
                '\nFormState\n',
                style: TextStyle(fontSize: 20.0),
              ),
              Text('FormState为Form的State类，可以通过Form.of()或GlobalKey获得。我们可以通过它来对Form的子孙FormField进行统一操作。我们看看其常用的三个方法：\n      FormState.validate()：调用此方法后，会调用Form子孙FormField的validate回调，如果有一个校验失败，则返回false，所有校验失败项都会返回用户返回的错误提示。\n      FormState.save()：调用此方法后，会调用Form子孙FormField的save回调，用于保存表单内容\n      FormState.reset()：调用此方法后，会将子孙FormField的内容清空。\n\n示例代码请看demo里源码\n'),
              RaisedButton(child: Text('示例演示'),onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return FormTestRoute();
                  }));
              },),
              Text('\n\n\n\n\n')
            ],
          ),
        ),
      ),
    );
  }
}
