import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridViewClass extends StatefulWidget {
  @override
  _GridViewClassState createState() => _GridViewClassState();
}

class _GridViewClassState extends State<GridViewClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView'),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                  'GridView可以构建一个二维网格列表，其默认构造函数定义如下：\n\nGridView({\n  Axis scrollDirection = Axis.vertical,\n  bool reverse = false,\n  ScrollController controller,\n  bool primary,\n  ScrollPhysics physics,\n  bool shrinkWrap = false,\n  EdgeInsetsGeometry padding,\n  @required SliverGridDelegate gridDelegate, //控制子widget layout的委托\n  bool addAutomaticKeepAlives = true,\n  bool addRepaintBoundaries = true,\n  double cacheExtent,\n  List<Widget> children = const <Widget>[],\n})\n\n我们可以看到，GridView和ListView的大多数参数都是相同的，它们的含义也都相同的，如有疑惑读者可以翻阅ListView一节，在此不再赘述。我们唯一需要关注的是gridDelegate参数，类型是SliverGridDelegate，它的作用是控制GridView子组件如何排列(layout)。\nSliverGridDelegate是一个抽象类，定义了GridView Layout相关接口，子类需要通过实现它们来实现具体的布局算法。Flutter中提供了两个SliverGridDelegate的子类SliverGridDelegateWithFixedCrossAxisCount和SliverGridDelegateWithMaxCrossAxisExtent，我们可以直接使用，下面我们分别来介绍一下它们。\n'),
              Text(
                'SliverGridDelegateWithFixedCrossAxisCount\n',
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                  '该子类实现了一个横轴为固定数量子元素的layout算法，其构造函数为：\n\nSliverGridDelegateWithFixedCrossAxisCount({\n  @required double crossAxisCount, \n  double mainAxisSpacing = 0.0,\n  double crossAxisSpacing = 0.0,\n  double childAspectRatio = 1.0,\n})\n\ncrossAxisCount：横轴子元素的数量。此属性值确定后子元素在横轴的长度就确定了，即ViewPort横轴长度除以crossAxisCount的商。\nmainAxisSpacing：主轴方向的间距。\ncrossAxisSpacing：横轴方向子元素的间距。\nchildAspectRatio：子元素在横轴长度和主轴长度的比例。由于crossAxisCount指定后，子元素横轴长度就确定了，然后通过此参数值就可以确定子元素在主轴的长度。\n\n可以发现，子元素的大小是通过crossAxisCount和childAspectRatio两个参数共同决定的。注意，这里的子元素指的是子组件的最大显示空间，注意确保子组件的实际大小不要超出子元素的空间。\n\n下面看一个例子：\n\nGridView(\n  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(\n      crossAxisCount: 3, //横轴三个子widget\n      childAspectRatio: 1.0 //宽高比为1时，子widget\n  ),\n  children:<Widget>[\n    Icon(Icons.ac_unit),\n    Icon(Icons.airport_shuttle),\n    Icon(Icons.all_inclusive),\n    Icon(Icons.beach_access),\n    Icon(Icons.cake),\n    Icon(Icons.free_breakfast)\n  ]\n);\n'),
              Image.network(
                'https://cdn.jsdelivr.net/gh/flutterchina/flutter-in-action/docs/imgs/6-9.png',
                width: 200,
              ),
              Text(
                '\nGridView.count\n',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                  'GridView.count构造函数内部使用了SliverGridDelegateWithFixedCrossAxisCount，我们通过它可以快速的创建横轴固定数量子元素的GridView，上面的示例代码等价于：\n\nGridView.count( \n  crossAxisCount: 3,\n  childAspectRatio: 1.0,\n  children: <Widget>[\n    Icon(Icons.ac_unit),\n    Icon(Icons.airport_shuttle),\n    Icon(Icons.all_inclusive),\n    Icon(Icons.beach_access),\n    Icon(Icons.cake),\n    Icon(Icons.free_breakfast),\n  ],\n);\n'),
              Text(
                'SliverGridDelegateWithMaxCrossAxisExtent\n',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                  '该子类实现了一个横轴子元素为固定最大长度的layout算法，其构造函数为：\n\nSliverGridDelegateWithMaxCrossAxisExtent({\n  double maxCrossAxisExtent,\n  double mainAxisSpacing = 0.0,\n  double crossAxisSpacing = 0.0,\n  double childAspectRatio = 1.0,\n})\n\nmaxCrossAxisExtent为子元素在横轴上的最大长度，之所以是“最大”长度，是因为横轴方向每个子元素的长度仍然是等分的，举个例子，如果ViewPort的横轴长度是450，那么当maxCrossAxisExtent的值在区间[450/4，450/3)内的话，子元素最终实际长度都为112.5，而childAspectRatio所指的子元素横轴和主轴的长度比为最终的长度比。其它参数和SliverGridDelegateWithFixedCrossAxisCount相同。\n\n下面我们看一个例子：\n\nGridView(\n  padding: EdgeInsets.zero,\n  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(\n      maxCrossAxisExtent: 120.0,\n      childAspectRatio: 2.0 //宽高比为2\n  ),\n  children: <Widget>[\n    Icon(Icons.ac_unit),\n    Icon(Icons.airport_shuttle),\n    Icon(Icons.all_inclusive),\n    Icon(Icons.beach_access),\n    Icon(Icons.cake),\n    Icon(Icons.free_breakfast),\n  ],\n);\n'),
              Image.network(
                'https://cdn.jsdelivr.net/gh/flutterchina/flutter-in-action/docs/imgs/6-10.png',
                width: 200,
              ),
              Text('\nGridView.extent\n', style: TextStyle(fontSize: 20),),
              Text('GridView.extent构造函数内部使用了SliverGridDelegateWithMaxCrossAxisExtent，我们通过它可以快速的创建纵轴子元素为固定最大长度的的GridView，上面的示例代码等价于：\n\nGridView.extent(\n   maxCrossAxisExtent: 120.0,\n   childAspectRatio: 2.0,\n   children: <Widget>[\n     Icon(Icons.ac_unit),\n     Icon(Icons.airport_shuttle),\n     Icon(Icons.all_inclusive),\n     Icon(Icons.beach_access),\n     Icon(Icons.cake),\n     Icon(Icons.free_breakfast),\n   ],\n );\n'),
              Text('GridView.builder\n', style: TextStyle(fontSize: 20)),
              Text('上面我们介绍的GridView都需要一个widget数组作为其子元素，这些方式都会提前将所有子widget都构建好，所以只适用于子widget数量比较少时，当子widget比较多时，我们可以通过GridView.builder来动态创建子widget。GridView.builder 必须指定的参数有两个\n\nGridView.builder(\n ...\n @required SliverGridDelegate gridDelegate, \n @required IndexedWidgetBuilder itemBuilder,\n)\n\n其中itemBuilder为子widget构建器。\n'),
              Text('示例\n', style: TextStyle(fontSize: 20),),
              Text('假设我们需要从一个异步数据源（如网络）分批获取一些Icon，然后用GridView来展示：\n\nclass InfiniteGridView extends StatefulWidget {\n  @override\n  _InfiniteGridViewState createState() => new _InfiniteGridViewState();\n}\n\nclass _InfiniteGridViewState extends State<InfiniteGridView> {\n  List<IconData> _icons = []; //保存Icon数据\n  @override\n  void initState() {\n    // 初始化数据  \n    _retrieveIcons();\n  }\n\n  @override\n  Widget build(BuildContext context) {\n    return GridView.builder(\n        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(\n            crossAxisCount: 3, //每行三列\n            childAspectRatio: 1.0 //显示区域宽高相等\n        ),\n        itemCount: _icons.length,\n        itemBuilder: (context, index) {\n          //如果显示到最后一个并且Icon总数小于200时继续获取数据\n          if (index == _icons.length - 1 && _icons.length < 200) {\n            _retrieveIcons();\n          }\n          return Icon(_icons[index]);\n        }\n    );\n  }\n\n  //模拟异步获取数据\n  void _retrieveIcons() {\n    Future.delayed(Duration(milliseconds: 200)).then((e) {\n      setState(() {\m        _icons.addAll([\n          Icons.ac_unit,\n          Icons.airport_shuttle,\n          Icons.all_inclusive,\n          Icons.beach_access, Icons.cake,\n          Icons.free_breakfast\n        ]);\n      });\n    });\n  }\n}\n\n_retrieveIcons()：在此方法中我们通过Future.delayed来模拟从异步数据源获取数据，每次获取数据需要200毫秒，获取成功后将新数据添加到_icons，然后调用setState重新构建。\n在itemBuilder中，如果显示到最后一个时，判断是否需要继续获取数据，然后返回一个Icon。\n'),
              Text('更多\n',  style: TextStyle(fontSize: 20),),
              Text('Flutter的GridView默认子元素显示空间是相等的，但在实际开发中，你可能会遇到子元素大小不等的情况，如下面这样的布局：\n'),
              Image.network('https://cdn.jsdelivr.net/gh/flutterchina/flutter-in-action/docs/imgs/6-11.png', width: 200,),
              Text('Pub上有一个包“flutter_staggered_grid_view” ，它实现了一个交错GridView的布局模型，可以很轻松的实现这种布局，详情读者可以自行了解。\n\n\n\n'),
            ],
          ),
        ),
      ),
    );
  }
}
