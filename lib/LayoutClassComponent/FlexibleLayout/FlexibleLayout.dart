import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/LayoutClassComponent/FlexibleLayout/FlexLayoutTestRoute.dart';

class FlexibleLayout extends StatefulWidget {
  @override
  _FlexibleLayoutState createState() => _FlexibleLayoutState();
}

class _FlexibleLayoutState extends State<FlexibleLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('弹性布局'),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                  '弹性布局允许子组件按照一定比例来分配父容器空间。弹性布局的概念在其它UI系统中也都存在，如H5中的弹性盒子布局，Android中的FlexboxLayout等。Flutter中的弹性布局主要通过Flex和Expanded来配合实现。\n'),
              Text(
                'Flex\n',
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                  'Flex组件可以沿着水平或垂直方向排列子组件，如果你知道主轴方向，使用Row或Column会方便一些，因为Row和Column都继承自Flex，参数基本相同，所以能使用Flex的地方基本上都可以使用Row或Column。Flex本身功能是很强大的，它也可以和Expanded组件配合实现弹性布局。接下来我们只讨论Flex和弹性布局相关的属性(其它属性已经在介绍Row和Column时介绍过了)。\n\nFlex({\n  ...\n  @required this.direction, //弹性布局的方向, Row默认为水平方向，Column默认为垂直方向\n  List<Widget> children = const <Widget>[],\n})\n\nFlex继承自MultiChildRenderObjectWidget，对应的RenderObject为RenderFlex，RenderFlex中实现了其布局算法。\n'),
              Text(
                'Expanded\n',
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                  '可以按比例“扩伸” Row、Column和Flex子组件所占用的空间。\n\nconst Expanded({\n  int flex = 1, \n  @required Widget child,\n})\n\nflex参数为弹性系数，如果为0或null，则child是没有弹性的，即不会被扩伸占用的空间。如果大于0，所有的Expanded按照其flex的比例来分割主轴的全部空闲空间。下面我们看一个例子：\n\nclass FlexLayoutTestRoute extends StatelessWidget {\n  @override\n  Widget build(BuildContext context) {\n    return Column(\n      children: <Widget>[\n        //Flex的两个子widget按1：2来占据水平空间 \n        Flex(\n          direction: Axis.horizontal,\n          children: <Widget>[\n            Expanded(\n              flex: 1,\n              child: Container(\n                height: 30.0,\n                color: Colors.red,\n              ),\n            ),\n            Expanded(\n              flex: 2,\n              child: Container(\n                height: 30.0,\n                color: Colors.green,\n              ),\n            ),\n          ],\n        ),\n        Padding(\n          padding: const EdgeInsets.only(top: 20.0),\n          child: SizedBox(\n            height: 100.0,\n            //Flex的三个子widget，在垂直方向按2：1：1来占用100像素的空间  \n            child: Flex(\n              direction: Axis.vertical,\n              children: <Widget>[\n                Expanded(\n                  flex: 2,\n                  child: Container(\n                    height: 30.0,\n                    color: Colors.red,\n                  ),\n                ),\n                Spacer(\n                  flex: 1,\n                ),\n                Expanded(\n                  flex: 1,\n                  child: Container(\n                    height: 30.0,\n                    color: Colors.green,\n                  ),\n                ),\n              ],\n            ),\n          ),\n        ),\n      ],\n    );\n  }\n}\n\n'),
              RaisedButton(
                child: Text('点击查看效果'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return FlexLayoutTestRoute();
                  }));
                },
              ),
              Text(
                  '\n示例中的Spacer的功能是占用指定比例的空间，实际上它只是Expanded的一个包装类，Spacer的源码如下：\n\nclass Spacer extends StatelessWidget {\n  const Spacer({Key key, this.flex = 1})\n    : assert(flex != null),\n      assert(flex > 0),\n      super(key: key);\n\n  final int flex;\n\n  @override\n  Widget build(BuildContext context) {\n    return Expanded(\n      flex: flex,\n      child: const SizedBox.shrink(),\n    );\n  }\n}\n\n\n\n')
            ],
          ),
        ),
      ),
    );
  }
}
