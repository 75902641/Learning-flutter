import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StreamingLayout extends StatefulWidget {
  @override
  _StreamingLayoutState createState() => _StreamingLayoutState();
}

class _StreamingLayoutState extends State<StreamingLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('流式布局'),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                  '在介绍Row和Colum时，如果子widget超出屏幕范围，则会报溢出错误，如：\n\nRow(\n  children: <Widget>[\n    Text("xxx"*100)\n  ],\n);\n运行效果如图\n'),
              Image.network(
                'https://cdn.jsdelivr.net/gh/flutterchina/flutter-in-action/docs/imgs/4-6.png',
                width: 200,
              ),
              Text(
                  '\n可以看到，右边溢出部分报错。这是因为Row默认只有一行，如果超出屏幕不会折行。我们把超出屏幕显示范围会自动折行的布局称为流式布局。Flutter中通过Wrap和Flow来支持流式布局，将上例中的Row换成Wrap后溢出部分则会自动折行，下面我们分别介绍Wrap和Flow.\n'),
              Text(
                'Wrap\n',
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                  "下面是Wrap的定义:\n\nWrap({\n  ...\n  this.direction = Axis.horizontal,\n  this.alignment = WrapAlignment.start,\n  this.spacing = 0.0,\n  this.runAlignment = WrapAlignment.start,\n  this.runSpacing = 0.0,\n  this.crossAxisAlignment = WrapCrossAlignment.start,\n  this.textDirection,\n  this.verticalDirection = VerticalDirection.down,\n  List<Widget> children = const <Widget>[],\n})\n\n我们可以看到Wrap的很多属性在Row（包括Flex和Column）中也有，如direction、crossAxisAlignment、textDirection、verticalDirection等，这些参数意义是相同的，我们不再重复介绍，读者可以查阅前面介绍Row的部分。读者可以认为Wrap和Flex（包括Row和Column）除了超出显示范围后Wrap会折行外，其它行为基本相同。下面我们看一下Wrap特有的几个属性：\n      spacing：主轴方向子widget的间距\n     runSpacing：纵轴方向的间距\n      runAlignment：纵轴方向的对齐方式\n\n下面看一个示例子：\n\nWrap(\n  spacing: 8.0, // 主轴(水平)方向间距\n  runSpacing: 4.0, // 纵轴（垂直）方向间距\n  alignment: WrapAlignment.center, //沿主轴方向居中\n  children: <Widget>[\n    new Chip(\n      avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('A')),\n      label: new Text('Hamilton'),\n    ),\n    new Chip(\n      avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('M')),\n      label: new Text('Lafayette'),\n    ),\n    new Chip(\n      avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('H')),\n      label: new Text('Mulligan'),\n    ),\n    new Chip(\n      avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('J')),\n      label: new Text('Laurens'),\n    ),\n  ],\n)\n\n运行效果如下"),
              Wrap(
                spacing: 8.0, // 主轴(水平)方向间距
                runSpacing: 4.0, // 纵轴（垂直）方向间距
                alignment: WrapAlignment.center, //沿主轴方向居中
                children: <Widget>[
                  new Chip(
                    avatar: new CircleAvatar(
                        backgroundColor: Colors.blue, child: Text('A')),
                    label: new Text('Hamilton'),
                  ),
                  new Chip(
                    avatar: new CircleAvatar(
                        backgroundColor: Colors.blue, child: Text('M')),
                    label: new Text('Lafayette'),
                  ),
                  new Chip(
                    avatar: new CircleAvatar(
                        backgroundColor: Colors.blue, child: Text('H')),
                    label: new Text('Mulligan'),
                  ),
                  new Chip(
                    avatar: new CircleAvatar(
                        backgroundColor: Colors.blue, child: Text('J')),
                    label: new Text('Laurens'),
                  ),
                ],
              ),
              Text(
                'Flow',
                style: TextStyle(fontSize: 20.0),
              ),
              Text('我们一般很少会使用Flow，因为其过于复杂，需要自己实现子widget的位置转换，在很多场景下首先要考虑的是Wrap是否满足需求。Flow主要用于一些需要自定义布局策略或性能要求较高(如动画中)的场景。Flow有如下优点：\n      性能好；Flow是一个对子组件尺寸以及位置调整非常高效的控件，Flow用转换矩阵在对子组件进行位置调整的时候进行了优化：在Flow定位过后，如果子组件的尺寸或者位置发生了变化，在FlowDelegate中的paintChildren()方法中调用context.paintChild 进行重绘，而context.paintChild在重绘时使用了转换矩阵，并没有实际调整组件位置。\n      灵活；由于我们需要自己实现FlowDelegate的paintChildren()方法，所以我们需要自己计算每一个组件的位置，因此，可以自定义布局策略。\n缺点：\n     使用复杂。\n      不能自适应子组件大小，必须通过指定父容器大小或实现TestFlowDelegate的getSize返回固定大小。\n\n示例：\n我们对六个色块进行自定义流式布局：\n\nFlow(\n  delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),\n  children: <Widget>[\n    new Container(width: 80.0, height:80.0, color: Colors.red,),\n    new Container(width: 80.0, height:80.0, color: Colors.green,),\n    new Container(width: 80.0, height:80.0, color: Colors.blue,),\n    new Container(width: 80.0, height:80.0,  color: Colors.yellow,),\n    new Container(width: 80.0, height:80.0, color: Colors.brown,),\n    new Container(width: 80.0, height:80.0,  color: Colors.purple,),\n  ],\n)\n\n实现TestFlowDelegate:\n\nclass TestFlowDelegate extends FlowDelegate {\n  EdgeInsets margin = EdgeInsets.zero;\n  TestFlowDelegate({this.margin});\n  @override\n  void paintChildren(FlowPaintingContext context) {\n    var x = margin.left;\n    var y = margin.top;\n    //计算每一个子widget的位置  \n    for (int i = 0; i < context.childCount; i++) {\n      var w = context.getChildSize(i).width + x + margin.right;\n      if (w < context.size.width) {\n        context.paintChild(i,transform: new Matrix4.translationValues(x, y, 0.0));\n        x = w + margin.left;\n      } else {\n        x = margin.left;\n        y += context.getChildSize(i).height + margin.top + margin.bottom;\n        //绘制子widget(有优化)  \n        context.paintChild(i,transform: new Matrix4.translationValues( x, y, 0.0));\n         x += context.getChildSize(i).width + margin.left + margin.right;\n      }\n    }\n  }\n\n  @override\n  getSize(BoxConstraints constraints){\n    //指定Flow的大小  \n    return Size(double.infinity,200.0);\n  }\n\n  @override\n  bool shouldRepaint(FlowDelegate oldDelegate) {\n    return oldDelegate != this;\n  }\n}\n\n运行效果\n'),
              Flow(
  delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
  children: <Widget>[
    new Container(width: 80.0, height:80.0, color: Colors.red,),
    new Container(width: 80.0, height:80.0, color: Colors.green,),
    new Container(width: 80.0, height:80.0, color: Colors.blue,),
    new Container(width: 80.0, height:80.0,  color: Colors.yellow,),
    new Container(width: 80.0, height:80.0, color: Colors.brown,),
    new Container(width: 80.0, height:80.0,  color: Colors.purple,),
  ],
)
              // RaisedButton(
              //   child: Text('查看效果'),
              //   onPressed: (){

              //   },
              // )  
            ],
          ),
        ),
      ),
    );
  }

  
}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;
  TestFlowDelegate({this.margin});
  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //计算每一个子widget的位置  
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i,
            transform: new Matrix4.translationValues(
                x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        //绘制子widget(有优化)  
        context.paintChild(i,
            transform: new Matrix4.translationValues(
                x, y, 0.0));
         x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  getSize(BoxConstraints constraints){
    //指定Flow的大小  
    return Size(double.infinity,200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}