import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ScrollableComponent/RollingMonitoringAndControl/ScrollControllerTestRoute.dart';

class RollingMonitoringAndControl extends StatefulWidget {
  @override
  _RollingMonitoringAndControlState createState() =>
      _RollingMonitoringAndControlState();
}

class _RollingMonitoringAndControlState
    extends State<RollingMonitoringAndControl> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('滚动监听及控制'),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                  '在前几节中，我们介绍了Flutter中常用的可滚动组件，也说过可以用ScrollController来控制可滚动组件的滚动位置，本节先介绍一下ScrollController，然后以ListView为例，展示一下ScrollController的具体用法。最后，再介绍一下路由切换时如何来保存滚动位置。\n'),
              Text(
                'ScrollController\n',
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                  'ScrollController构造函数如下：\n\nScrollController({\n  double initialScrollOffset = 0.0, //初始滚动位置\n  this.keepScrollOffset = true,//是否保存滚动位置\n  ...\n})\n\n我们介绍一下ScrollController常用的属性和方法：\noffset：可滚动组件当前的滚动位置。\njumpTo(double offset)、animateTo(double offset,...)：这两个方法用于跳转到指定的位置，它们不同之处在于，后者在跳转时会执行一个动画，而前者不会。\n\nScrollController还有一些属性和方法，我们将在后面原理部分解释。\n'),
              Text(
                '滚动监听\n',
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                  'ScrollController间接继承自Listenable，我们可以根据ScrollController来监听滚动事件，如：\n\ncontroller.addListener(()=>print(controller.offset))\n'),
              Text(
                '示例\n',
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                  '我们创建一个ListView，当滚动位置发生变化时，我们先打印出当前滚动位置，然后判断当前位置是否超过1000像素，如果超过则在屏幕右下角显示一个“返回顶部”的按钮，该按钮点击后可以使ListView恢复到初始位置；如果没有超过1000像素，则隐藏“返回顶部”按钮。代码请看demo\n'),
              RaisedButton(
                child: Text('点击查看效果'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ScrollControllerTestRoute();
                  }));
                },
              ),
              Text('\n由于列表项高度为50像素，当滑动到第20个列表项后，右下角“返回顶部”按钮会显示，点击该按钮，ListView会在返回顶部的过程中执行一个滚动动画，动画时间是200毫秒，动画曲线是Curves.ease，关于动画的详细内容我们将在后面“动画”一章中详细介绍。\n'),
              Text(
                '滚动位置恢复\n',
                style: TextStyle(fontSize: 20.0),
              ),
              Text('PageStorage是一个用于保存页面(路由)相关数据的组件，它并不会影响子树的UI外观，其实，PageStorage是一个功能型组件，它拥有一个存储桶（bucket），子树中的Widget可以通过指定不同的PageStorageKey来存储各自的数据或状态。\n\n每次滚动结束，可滚动组件都会将滚动位置offset存储到PageStorage中，当可滚动组件重新创建时再恢复。如果ScrollController.keepScrollOffset为false，则滚动位置将不会被存储，可滚动组件重新创建时会使用ScrollController.initialScrollOffset；ScrollController.keepScrollOffset为true时，可滚动组件在第一次创建时，会滚动到initialScrollOffset处，因为这时还没有存储过滚动位置。在接下来的滚动中就会存储、恢复滚动位置，而initialScrollOffset会被忽略。\n\n当一个路由中包含多个可滚动组件时，如果你发现在进行一些跳转或切换操作后，滚动位置不能正确恢复，这时你可以通过显式指定PageStorageKey来分别跟踪不同的可滚动组件的位置，如：\n\nListView(key: PageStorageKey(1), ... );\n...\nListView(key: PageStorageKey(2), ... );\n\n不同的PageStorageKey，需要不同的值，这样才可以为不同可滚动组件保存其滚动位置。\n\n注意：一个路由中包含多个可滚动组件时，如果要分别跟踪它们的滚动位置，并非一定就得给他们分别提供PageStorageKey。这是因为Scrollable本身是一个StatefulWidget，它的状态中也会保存当前滚动位置，所以，只要可滚动组件本身没有被从树上detach掉，那么其State就不会销毁(dispose)，滚动位置就不会丢失。只有当Widget发生结构变化，导致可滚动组件的State销毁或重新构建时才会丢失状态，这种情况就需要显式指定PageStorageKey，通过PageStorage来存储滚动位置，一个典型的场景是在使用TabBarView时，在Tab发生切换时，Tab页中的可滚动组件的State就会销毁，这时如果想恢复滚动位置就需要指定PageStorageKey。'),

            ],
          ),
        ),
      ),
    );
  }
}
