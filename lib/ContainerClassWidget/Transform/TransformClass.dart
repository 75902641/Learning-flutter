import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransformClass extends StatefulWidget {
  @override
  _TransformClassState createState() => _TransformClassState();
}

class _TransformClassState extends State<TransformClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('变换'),
        ),
        body: Scrollbar(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                    "Transform可以在其子组件绘制时对其应用一些矩阵变换来实现一些特效。Matrix4是一个4D矩阵，通过它我们可以实现各种矩阵操作，下面是一个例子：\n\nContainer(\n  color: Colors.black,\n  child: new Transform(\n    alignment: Alignment.topRight, //相对于坐标系原点的对齐方式\n    transform: new Matrix4.skewY(0.3), //沿Y轴倾斜0.3弧度\n    child: new Container(\n      padding: const EdgeInsets.all(8.0),\n      color: Colors.deepOrange,\n      child: const Text('Apartment for rent!'),\n    ),\n  ),\n);\n\n运行效果如下\n\n\n\n"),
                Container(
                  color: Colors.black,
                  child: new Transform(
                    alignment: Alignment.topRight, //相对于坐标系原点的对齐方式
                    transform: new Matrix4.skewY(0.3), //沿Y轴倾斜0.3弧度
                    child: new Container(
                      padding: const EdgeInsets.all(8.0),
                      color: Colors.deepOrange,
                      child: const Text('Apartment for rent!'),
                    ),
                  ),
                ),
                Text(
                    '\n关于矩阵变换的相关内容属于线性代数范畴，本书不做讨论，读者有兴趣可以自行了解。本书中，我们把焦点放在Flutter中一些常见的变换效果上。另外，由于矩阵变化时发生在绘制时，而无需重新布局和构建等过程，所以性能很好。\n'),
                Text(
                  '平移\n',
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(
                    'Transform.translate接收一个offset参数，可以在绘制时沿x、y轴对子组件平移指定的距离。\n\nDecoratedBox(\n  decoration:BoxDecoration(color: Colors.red),\n  //默认原点为左上角，左移20像素，向上平移5像素 \n  child: Transform.translate(\n    offset: Offset(-20.0, -5.0),\n    child: Text("Hello world"),\n  ),\n)\n\n效果如下\n'),
                DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                  //默认原点为左上角，左移20像素，向上平移5像素
                  child: Transform.translate(
                    offset: Offset(-20.0, -5.0),
                    child: Text("Hello world"),
                  ),
                ),
                Text(
                  '\n旋转\n',
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(
                    'Transform.rotate可以对子组件进行旋转变换，如：\n\nDecoratedBox(\n  decoration:BoxDecoration(color: Colors.red),\n  child: Transform.rotate(\n    //旋转90度\n    angle:math.pi/2 ,\n    child: Text("Hello world"),\n  ),\n)；\n\n注意：要使用math.pi需先进行如下导包。\nimport "dart:math" as math;\n效果如下\n'),
                Image.network(
                  'https://cdn.jsdelivr.net/gh/flutterchina/flutter-in-action/docs/imgs/5-12.png',
                  width: 200,
                ),
                Text(
                  '\n缩放\n',
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(
                    'Transform.scale可以对子组件进行缩小或放大，如：\n\nDecoratedBox(\n  decoration:BoxDecoration(color: Colors.red),\n  child: Transform.scale(\n      scale: 1.5, //放大到1.5倍\n      child: Text("Hello world")\n  )\n);\n\n效果如下\n'),
                DecoratedBox(
                    decoration: BoxDecoration(color: Colors.red),
                    child: Transform.scale(
                        scale: 1.5, //放大到1.5倍
                        child: Text("Hello world"))),
                Text(
                  '\n注意\n',
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(
                    'Transform的变换是应用在绘制阶段，而并不是应用在布局(layout)阶段，所以无论对子组件应用何种变化，其占用空间的大小和在屏幕上的位置都是固定不变的，因为这些是在布局阶段就确定的。下面我们具体说明：\n\n Row(\n  mainAxisAlignment: MainAxisAlignment.center,\n  children: <Widget>[\n    DecoratedBox(\n      decoration:BoxDecoration(color: Colors.red),\n      child: Transform.scale(scale: 1.5,\n          child: Text("Hello world")\n      )\n    ),\n    Text("你好", style: TextStyle(color: Colors.green, fontSize: 18.0),)\n  ],\n)\n\n运行效果如下\n'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    DecoratedBox(
                        decoration: BoxDecoration(color: Colors.red),
                        child: Transform.scale(
                            scale: 1.5, child: Text("Hello world"))),
                    Text(
                      "你好",
                      style: TextStyle(color: Colors.green, fontSize: 18.0),
                    )
                  ],
                ),
                Text(
                    '\n由于第一个Text应用变换(放大)后，其在绘制时会放大，但其占用的空间依然为红色部分，所以第二个Text会紧挨着红色部分，最终就会出现文字重合。\n由于矩阵变化只会作用在绘制阶段，所以在某些场景下，在UI需要变化时，可以直接通过矩阵变化来达到视觉上的UI改变，而不需要去重新触发build流程，这样会节省layout的开销，所以性能会比较好。如之前介绍的Flow组件，它内部就是用矩阵变换来更新UI，除此之外，Flutter的动画组件中也大量使用了Transform以提高性能。\n'),
                Text(
                  'RotatedBox\n',
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(
                    'RotatedBox和Transform.rotate功能相似，它们都可以对子组件进行旋转变换，但是有一点不同：RotatedBox的变换是在layout阶段，会影响在子组件的位置和大小。我们将上面介绍Transform.rotate时的示例改一下：\n\nRow(\n  mainAxisAlignment: MainAxisAlignment.center,\n  children: <Widget>[\n    DecoratedBox(\n      decoration: BoxDecoration(color: Colors.red),\n      //将Transform.rotate换成RotatedBox  \n      child: RotatedBox(\n        quarterTurns: 1, //旋转90度(1/4圈)\n        child: Text("Hello world"),\n      ),\n    ),\n    Text("你好", style: TextStyle(color: Colors.green, fontSize: 18.0),)\n  ],\n),\n\n效果如下\n'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    DecoratedBox(
                      decoration: BoxDecoration(color: Colors.red),
                      //将Transform.rotate换成RotatedBox
                      child: RotatedBox(
                        quarterTurns: 1, //旋转90度(1/4圈)
                        child: Text("Hello world"),
                      ),
                    ),
                    Text(
                      "你好",
                      style: TextStyle(color: Colors.green, fontSize: 18.0),
                    )
                  ],
                ),
                Text('\n由于RotatedBox是作用于layout阶段，所以子组件会旋转90度（而不只是绘制的内容），decoration会作用到子组件所占用的实际空间上，所以最终就是上图的效果，读者可以和前面Transform.rotate示例对比理解。\n\n\n\n')
              ],
            ),
          ),
        ));
  }
}
