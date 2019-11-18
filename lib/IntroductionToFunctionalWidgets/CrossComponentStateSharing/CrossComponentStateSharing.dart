import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CrossComponentStateSharing extends StatefulWidget {
  @override
  _CrossComponentStateSharingState createState() => _CrossComponentStateSharingState();
}

class _CrossComponentStateSharingState extends State<CrossComponentStateSharing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('跨组件状态共享（Provider）'),),
      body: Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('在Flutter开发中，状态管理是一个永恒的话题。一般的原则是：如果状态是组件私有的，则应该由组件自己管理；如果状态要跨组件共享，则该状态应该由各个组件共同的父元素来管理。对于组件私有的状态管理很好理解，但对于跨组件共享的状态，管理的方式就比较多了，如使用全局事件总线EventBus（将在下一章中介绍），它是一个观察者模式的实现，通过它就可以实现跨组件状态同步：状态持有方（发布者）负责更新、发布状态，状态使用方（观察者）监听状态改变事件来执行一些操作。下面我们看一个登陆状态同步的简单示例：\n\n定义事件：\n\nenum Event{\n  login,\n  ... //省略其它事件\n}\n\n登录页代码大致如下：\n\n// 登录状态改变后发布状态改变事件\nbus.emit(Event.login);\n\n依赖登录状态的页面：\n\nvoid onLoginChanged(e){\n  //登录状态变化处理逻辑\n}\n\n@override\nvoid initState() {\n  //订阅登录状态改变事件\n  bus.on(Event.login,onLogin);\n  super.initState();\n}\n\n@override\nvoid dispose() {\n  //取消订阅\n  bus.off(Event.login,onLogin);\n  super.dispose();\n}\n\n我们可以发现，通过观察者模式来实现跨组件状态共享有一些明显的缺点：\n1.必须显式定义各种事件，不好管理\n2.订阅者必须需显式注册状态改变回调，也必须在组件销毁时手动去解绑回调以避免内存泄露。\n\n在Flutter当中有没有更好的跨组件状态管理方式了呢？答案是肯定的，那怎么做的？我们想想前面介绍的InheritedWidget，它的天生特性就是能绑定InheritedWidget与依赖它的子孙组件的依赖关系，并且当InheritedWidget数据发生变化时，可以自动更新依赖的子孙组件！利用这个特性，我们可以将需要跨组件共享的状态保存在InheritedWidget中，然后在子组件中引用InheritedWidget即可，Flutter社区著名的Provider包正是基于这个思想实现的一套跨组件状态共享解决方案，接下来我们便详细介绍一下Provider的用法及原理。\n'),
              Text('Provider\n', style: TextStyle(fontSize: 20.0),),
              Text('为了加强读者的理解，我们不直接去看Provider包的源代码，相反，我会带着你根据上面描述的通过InheritedWidget实现的思路来一步一步地实现一个最小功能的Provider。\n\n首先，我们需要一个保存需要共享的数据InheritedWidget，由于具体业务数据类型不可预期，为了通用性，我们使用泛型，定义一个通用的InheritedProvider类，它继承自InheritedWidget：\n\n// 一个通用的InheritedWidget，保存任需要跨组件共享的状态\nclass InheritedProvider<T> extends InheritedWidget {\n  InheritedProvider({@required this.data, Widget child}) : super(child: child);\n\n  //共享状态使用泛型\n  final T data;\n\n  @override\n  bool updateShouldNotify(InheritedProvider<T> old) {\n    //在此简单返回true，则每次更新都会调用依赖其的子孙节点的`didChangeDependencies`。\n    return true;\n  }\n}\n\n数据保存的地方有了，那么接下来我们需要做的就是在数据发生变化的时候来重新构建InheritedProvider，那么现在就面临两个问题：\n\n1.数据发生变化怎么通知？\n2.谁来重新构建InheritedProvider？\n第一个问题其实很好解决，我们当然可以使用之前介绍的eventBus来进行事件通知，但是为了更贴近Flutter开发，我们使用Flutter中SDK中提供的ChangeNotifier类 ，它继承自Listenable，也实现了一个Flutter风格的发布者-订阅者模式，ChangeNotifier定义大致如下：\n\nclass ChangeNotifier implements Listenable {\n\n  @override\n  void addListener(VoidCallback listener) {\n     //添加监听器\n  }\n  @override\n  void removeListener(VoidCallback listener) {\n    //移除监听器\n  }\n\n  void notifyListeners() {\n    //通知所有监听器，触发监听器回调   \n  }\n\n  ... //省略无关代码\n}\n\n我们可以通过调用addListener()和removeListener()来添加、移除监听器（订阅者）；通过调用notifyListeners() 可以触发所有监听器回调。\n\n现在，我们将要共享的状态放到一个Model类中，然后让它继承自ChangeNotifier，这样当共享的状态改变时，我们只需要调用notifyListeners() 来通知订阅者，然后由订阅者来重新构建InheritedProvider，这也是第二个问题的答案！接下来我们便实现这个订阅者类：\n\n// 该方法用于在Dart中获取模板类型\nType _typeOf<T>() => T;\n\nclass ChangeNotifierProvider<T extends ChangeNotifier> extends StatefulWidget {\n  ChangeNotifierProvider({\n    Key key,\n    this.data,\n    this.child,\n  });\n\n  final Widget child;\n  final T data;\n\n  //定义一个便捷方法，方便子树中的widget获取共享数据\n  static T of<T>(BuildContext context) {\n    final type = _typeOf<InheritedProvider<T>>();\n    final provider =  context.inheritFromWidgetOfExactType(type) as InheritedProvider<T>；\n    return provider.data;\n  }\n\n  @override\n  _ChangeNotifierProviderState<T> createState() => _ChangeNotifierProviderState<T>();\n}\n\n该类继承StatefulWidget，然后定义了一个of()静态方法供子类方便获取Widget树中的InheritedProvider中保存的共享状态(model)，下面我们实现该类对应的_ChangeNotifierProviderState类：\n\nclass _ChangeNotifierProviderState<T extends ChangeNotifier> extends State<ChangeNotifierProvider<T>> {\nvoid update() {\n    //如果数据发生变化（model类调用了notifyListeners），重新构建InheritedProvider\n    setState(() => {});  \n}\n\n@override\n  void didUpdateWidget(ChangeNotifierProvider<T> oldWidget) {\n    //当Provider更新时，如果新旧数据不"=="，则解绑旧数据监听，同时添加新数据监听\n    if (widget.data != oldWidget.data) {\n      oldWidget.data.removeListener(update);\nwidget.data.addListener(update);\n    }\n    super.didUpdateWidget(oldWidget);\n  }\n\n@override\n  void initState() {\n    // 给model添加监听器\n    widget.data.addListener(update);\n    super.initState();\n  }\n  @override\n  void dispose() {\n    // 移除model的监听器\n    widget.data.removeListener(update);\n    super.dispose();\n  }\n\n  @override\n  Widget build(BuildContext context) {\n    return InheritedProvider<T>(\n      data: widget.data,\n      child: widget.child,\n    );\n  }\n}\n\n可以看到_ChangeNotifierProviderState类的主要作用就是监听到共享状态（model）改变时重新构建Widget树。注意，在_ChangeNotifierProviderState类中调用setState()方法，widget.child始终是同一个，所以执行build时，InheritedProvider的child引用的始终是同一个子widget，所以widget.child并不会重新build，这也就相当于对child进行了缓存！当然如果ChangeNotifierProvider父级Widget重新build时，则其传入的child便有可能会发生变化。\n\n现在我们所需要的各个工具类都已完成，下面我们通过一个购物车的例子来看看怎么使用上面的这些类。\n'),
             

            ],
          ),
        ),
      ),
    );
  }
}