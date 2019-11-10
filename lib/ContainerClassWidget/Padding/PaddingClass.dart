import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaddingClass extends StatefulWidget {
  @override
  _PaddingClassState createState() => _PaddingClassState();
}

class _PaddingClassState extends State<PaddingClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('填充'),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                  'Padding可以给其子节点添加填充（留白），和边距效果类似。我们在前面很多示例中都已经使用过它了，现在来看看它的定义：\n\nPadding({\n  ...\n  EdgeInsetsGeometry padding,\n  Widget child,\n})\n\nEdgeInsetsGeometry是一个抽象类，开发中，我们一般都使用EdgeInsets类，它是EdgeInsetsGeometry的一个子类，定义了一些设置填充的便捷方法。'),
              Text(
                '\nEdgeInsets\n',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                  '我们看看EdgeInsets提供的便捷方法：\n\n      fromLTRB(double left, double top, double right, double bottom)：分别指定四个方向的填充。\n      all(double value) : 所有方向均使用相同数值的填充。\n      only({left, top, right ,bottom })：可以设置具体某个方向的填充(可以同时指定多个方向)。\n     symmetric({ vertical, horizontal })：用于设置对称方向的填充，vertical指top和bottom，horizontal指left和right。'),
              Text(
                '\n示例\n',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                  '下面的示例主要展示了EdgeInsets的不同用法，比较简单，源码如下：\n\nclass PaddingTestRoute extends StatelessWidget {\n  @override\n  Widget build(BuildContext context) {\n    return Padding(\n      //上下左右各添加16像素补白\n      padding: EdgeInsets.all(16.0),\n      child: Column(\n        //显式指定对齐方式为左对齐，排除对齐干扰\n        crossAxisAlignment: CrossAxisAlignment.start,\n        children: <Widget>[\n          Padding(\n            //左边添加8像素补白\n            padding: const EdgeInsets.only(left: 8.0),\n            child: Text("Hello world"),\n          ),\n          Padding(\n            //上下各添加8像素补白\n            padding: const EdgeInsets.symmetric(vertical: 8.0),\n            child: Text("I am Jack"),\n          ),\n          Padding(\n            // 分别指定四个方向的补白\n            padding: const EdgeInsets.fromLTRB(20.0,.0,20.0,20.0),\n            child: Text("Your friend"),\n          )\n        ],\n      ),\n    );\n  }\n}\n\n运行效果如下\n'),
              Padding(
                //左边添加8像素补白
                padding: const EdgeInsets.only(left: 8.0),
                child: Text("Hello world"),
              ),
              Padding(
                //上下各添加8像素补白
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text("I am Jack"),
              ),
              Padding(
                // 分别指定四个方向的补白
                padding: const EdgeInsets.fromLTRB(20.0, .0, 20.0, 20.0),
                child: Text("Your friend"),
              ),
              Text('\n\n\n\n\n')
            ],
          ),
        ),
      ),
    );
  }
}
