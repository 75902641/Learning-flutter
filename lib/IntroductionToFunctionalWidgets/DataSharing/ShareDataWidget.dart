import 'package:flutter/cupertino.dart';

class ShareDataWidget extends InheritedWidget{
  ShareDataWidget({
    @required this.data,
    Widget child
  }) : super(child: child);

  final int data;//需要在子树中共享的数据，保存点击次数

//定义一个便捷方法，方便子树中的widget获取共享数据  
  static ShareDataWidget of (BuildContext context){
    return context.inheritFromWidgetOfExactType(ShareDataWidget);
  }

  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
     //如果返回true，则子树中依赖(build函数中有调用)本widget
    //的子widget的`state.didChangeDependencies`会被调用
    return oldWidget.data != data;
  }

}