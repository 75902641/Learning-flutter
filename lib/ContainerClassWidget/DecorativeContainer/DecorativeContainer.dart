import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DecorativeContainer extends StatefulWidget {
  @override
  _DecorativeContainerState createState() => _DecorativeContainerState();
}

class _DecorativeContainerState extends State<DecorativeContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('装饰容器DecoratedBox'),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                  'DecoratedBox可以在其子组件绘制前(或后)绘制一些装饰（Decoration），如背景、边框、渐变等。DecoratedBox定义如下：\n\nconst DecoratedBox({\n  Decoration decoration,\n  DecorationPosition position = DecorationPosition.background,\n  Widget child\n})\n\n      decoration：代表将要绘制的装饰，它的类型为Decoration。Decoration是一个抽象类，它定义了一个接口 createBoxPainter()，子类的主要职责是需要通过实现它来创建一个画笔，该画笔用于绘制装饰。\n     position：此属性决定在哪里绘制Decoration，它接收DecorationPosition的枚举类型，该枚举类有两个值：\n\n            background：在子组件之后绘制，即背景装饰。\n            foreground：在子组件之上绘制，即前景。\n'),
              Text(
                'BoxDecoration\n',
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                  '我们通常会直接使用BoxDecoration类，它是一个Decoration的子类，实现了常用的装饰元素的绘制。\n\nBoxDecoration({\n  Color color, //颜色\n  DecorationImage image,//图片\n  BoxBorder border, //边框\n  BorderRadiusGeometry borderRadius, //圆角\n  List<BoxShadow> boxShadow, //阴影,可以指定多个\n  Gradient gradient, //渐变\n  BlendMode backgroundBlendMode, //背景混合模式\n  BoxShape shape = BoxShape.rectangle, //形状\n})\n\n各个属性名都是自解释的，详情读者可以查看API文档。下面我们实现一个带阴影的背景色渐变的按钮：\n\n DecoratedBox(\n    decoration: BoxDecoration(\n      gradient: LinearGradient(colors:[Colors.red,Colors.orange[700]]), //背景渐变\n      borderRadius: BorderRadius.circular(3.0), //3像素圆角\n      boxShadow: [ //阴影\n        BoxShadow(\n            color:Colors.black54,\n            offset: Offset(2.0,2.0),\n            blurRadius: 4.0\n        )\n      ]\n    ),\n  child: Padding(padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 18.0),\n    child: Text("Login", style: TextStyle(color: Colors.white),),\n  )\n)\n\n运行后效果如图'),
              DecoratedBox(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.red, Colors.orange[700]]), //背景渐变
                      borderRadius: BorderRadius.circular(3.0), //3像素圆角
                      boxShadow: [
                        //阴影
                        BoxShadow(
                            color: Colors.black54,
                            offset: Offset(2.0, 2.0),
                            blurRadius: 4.0)
                      ]),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 80.0, vertical: 18.0),
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                  Text('\n\n\n\n')
            ],
          ),
        ),
      ),
    );
  }
}
