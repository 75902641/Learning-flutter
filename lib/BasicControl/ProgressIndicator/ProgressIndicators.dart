import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/BasicControl/ProgressIndicator/ProgressRoute.dart';

class ProgressIndicators extends StatefulWidget {
  @override
  _ProgressIndicatorsState createState() => _ProgressIndicatorsState();
}

class _ProgressIndicatorsState extends State<ProgressIndicators> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('进度指示器'),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                  'Material 组件库中提供了两种进度指示器：LinearProgressIndicator和CircularProgressIndicator，它们都可以同时用于精确的进度指示和模糊的进度指示。精确进度通常用于任务进度可以计算和预估的情况，比如文件下载；而模糊进度则用户任务进度无法准确获得的情况，如下拉刷新，数据提交等。'),
              Text(
                '\nLinearProgressIndicator\n',
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                  'LinearProgressIndicator是一个线性、条状的进度条，定义如下：\n\nLinearProgressIndicator({\n  double value,\n  Color backgroundColor,\n  Animation<Color> valueColor,\n  ...\n})\n\n      value：value表示当前的进度，取值范围为[0,1]；如果value为null时则指示器会执行一个循环动画（模糊进度）；当value不为null时，指示器为一个具体进度的进度条。\n      backgroundColor：指示器的背景色。\n      valueColor: 指示器的进度条颜色；值得注意的是，该值类型是Animation<Color>，这允许我们对进度条的颜色也可以指定动画。如果我们不需要对进度条颜色执行动画，换言之，我们想对进度条应用一种固定的颜色，此时我们可以通过AlwaysStoppedAnimation来指定。'),
              Text(
                '\n示例\n',
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                  '// 模糊进度条(会执行一个动画)\nLinearProgressIndicator(\n  backgroundColor: Colors.grey[200],\n  valueColor: AlwaysStoppedAnimation(Colors.blue),\n),\n//进度条显示50%\nLinearProgressIndicator(\n  backgroundColor: Colors.grey[200],\n  valueColor: AlwaysStoppedAnimation(Colors.blue),\n  value: .5, \n)\n运行效果如下\n'),
              LinearProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
              ),
              Text('\n'),
              LinearProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                value: 0.5,
              ),
              Text('\n第一个进度条在执行循环动画：蓝色条一直在移动，而第二个进度条是静止的，停在50%的位置。\n'),
              Text(
                '\nCircularProgressIndicator\n',
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                  'CircularProgressIndicator是一个圆形进度条，定义如下：\n\n CircularProgressIndicator({\n  double value,\n  Color backgroundColor,\n  Animation<Color> valueColor,\n  this.strokeWidth = 4.0,\n  ...  \n})\n\n前三个参数和LinearProgressIndicator相同，不再赘述。strokeWidth 表示圆形进度条的粗细。示例如下：\n\n// 模糊进度条(会执行一个旋转动画)\nCircularProgressIndicator(\n  backgroundColor: Colors.grey[200],\n  valueColor: AlwaysStoppedAnimation(Colors.blue),\n),\n//进度条显示50%，会显示一个半圆\nCircularProgressIndicator(\n  backgroundColor: Colors.grey[200],\n  valueColor: AlwaysStoppedAnimation(Colors.blue),\n  value: .5,\n),\n\n运行效果如下\n'),
              CircularProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
              ),
              Text('\n'),
              CircularProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                value: 0.5,
              ),
              Text('\n第一个进度条会执行旋转动画，而第二个进度条是静止的，它停在50%的位置。\n'),
              Text(
                '\n自定义尺寸\n',
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                  '\n我们可以发现LinearProgressIndicator和CircularProgressIndicator，并没有提供设置圆形进度条尺寸的参数；如果我们希望LinearProgressIndicator的线细一些，或者希望CircularProgressIndicator的圆大一些该怎么做？\n\n其实LinearProgressIndicator和CircularProgressIndicator都是取父容器的尺寸作为绘制的边界的。知道了这点，我们便可以通过尺寸限制类Widget，如ConstrainedBox、SizedBox （我们将在后面容器类组件一章中介绍）来指定尺寸，如：\n\n// 线性进度条高度指定为3\nSizedBox(\n  height: 3,\n  child: LinearProgressIndicator(\n    backgroundColor: Colors.grey[200],\n    valueColor: AlwaysStoppedAnimation(Colors.blue),\n    value: .5,\n  ),\n),\n// 圆形进度条直径指定为100\nSizedBox(\n  height: 100,\n  width: 100,\n  child: CircularProgressIndicator(\n    backgroundColor: Colors.grey[200],\n    valueColor: AlwaysStoppedAnimation(Colors.blue),\n    value: .7,\n  ),\n),\n\n运行效果如下\n\n'),
              SizedBox(
                height: 3,
                child: LinearProgressIndicator(
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                  value: .5,
                ),
              ),
              Text('\n'),
              SizedBox(
                width: 100,
                height: 100,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                  value: .7,
                ),
              ),
              Text(
                  '\n注意，如果CircularProgressIndicator显示空间的宽高不同，则会显示为椭圆。如：\n\n// 宽高不等\nSizedBox(\n  height: 100,\n  width: 130,\n  child: CircularProgressIndicator(\n    backgroundColor: Colors.grey[200],\n    valueColor: AlwaysStoppedAnimation(Colors.blue),\n    value: .7,\n  ),\n),\n运行效果如下\n\n'),
              SizedBox(
                height: 100,
                width: 130,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                  value: .7,
                ),
              ),
              Text(
                '\n进度色动画\n',
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                  '前面说过可以通过valueColor对进度条颜色做动画，关于动画我们将在后面专门的章节详细介绍，这里先给出一个例子，读者在了解了Flutter动画一章后再回过头来看。\n我们实现一个进度条在3秒内从灰色变成蓝色的动画，代码请到demo里看\n'),
              RaisedButton(
                child: Text('查看效果'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ProgressRoute();
                  }));
                },
              ),
              Text(
                '\n自定义进度指示器样式\n',
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                  '定制进度指示器风格样式，可以通过CustomPainter Widget 来自定义绘制逻辑，实际上LinearProgressIndicator和CircularProgressIndicator也正是通过CustomPainter来实现外观绘制的。关于CustomPainter，我们将在后面“自定义Widget”一章中详细介绍。\n\n\n\n'),
            ],
          ),
        ),
      ),
    );
  }
}
